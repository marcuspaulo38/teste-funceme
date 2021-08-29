<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Meeting;
use App\Http\Requests\MeetingRequest;
use App\Notifications\NewMeetingNotification;
use App\Http\Resources\MeetingCollection;

use Carbon\Carbon;

class MeetingController extends Controller{

    
    public function get(Request $request){
      
        $data = $request->all();
        
        $name = isset($data['name']) ? $data['name'] : '';
        $email = isset($data['email']) ? $data['email'] : '';
        $subject = isset($data['subject']) ? $data['subject'] : '';
        $date = isset($data['date']) ? $data['date'] : '';
        $start = isset($data['start']) ? $data['start'] : '';
        $end = isset($data['end']) ? $data['end'] : '';
        $date_start = isset($data['date_start']) ? $data['date_start'] : false;
        $date_end = isset($data['date_end']) ? $data['date_end'] : false;
        $filteringMeetingsAccept = isset($data['filteringMeetingsAccept']) && $data['filteringMeetingsAccept'] == "true" ? true : false;
        $filteringNewMeetings = isset($data['filteringNewMeetings']) && $data['filteringNewMeetings'] == "true" ? true : false;
        $futureMeetings = isset($data['futureMeetings']) && $data['futureMeetings'] == "true" ? true : false;
        
        $meetings = Meeting::where('name', 'like', '%'.$name.'%')
        ->where('email', 'like', '%'.$email.'%')
        ->where('subject', 'like', '%'.$subject.'%')
        ->where('date', 'like', '%'.$date.'%')
        ->where('start', 'like', '%'.$start.'%')
        ->where('end', 'like', '%'.$end.'%')
        ->when($date_start, function ($query, $date_start) {
            return $query->where('date', '>=', $date_start);
        })->when($date_end, function ($query, $date_end) {
            return $query->where('date', '<=', $date_end);
        })->when($filteringMeetingsAccept, function ($query, $filteringMeetingsAccept) {
            return $query->where('status', true);
        })->when($filteringNewMeetings, function ($query, $filteringNewMeetings) {
            return $query->where('new', true);
        })->when($futureMeetings, function ($query, $futureMeetings) {
            return $query->where('date','>=',Carbon::now()->format('Y-m-d'));
        })
        ->orderBy('date', 'asc')->orderBy('start', 'asc')->get();

        return new MeetingCollection($meetings);
        
    }

    
    public function show($id){
        
        return Meeting::findOrFail($id);
    }
    

    public function store(MeetingRequest $request){
        
        $data = $request->all();
        
        $meeting = Meeting::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'subject' => $data['subject'],
            'date' => $data['date'],
            'start' => $data['start'],
            'end' => $data['end'],
            'status' => 0,
            'new' => 1,
        ]);
        
        try {
            $date = Carbon::parse($meeting->date)->format('d/m/Y');
            $start = Carbon::parse($meeting->start)->format('H:i');
            $end = Carbon::parse($meeting->end)->format('H:i');;
            
            $message = "<p>Nova reunião aguardando...</p><p>Agendada por: ".$meeting->name."<br />Data: ".$date." ".$start." até ".$end."<br />Pauta: ".$meeting->subject."</p>";
            \Notification::route('mail', 'marcusantoniopaulo@gmail.com')->notify(new NewMeetingNotification($meeting->name, 'Marcus Paulo | Agendamento', $message));
            
            $message = "<p>Olá, ".$meeting->name."<br />Sua reunião foi agendada, aguardando aprovação.</p><p>Data: ".$date." ".$start." até ".$end."<br />Pauta: ".$meeting->subject."</p>";
        } catch (\Throwable $th) {
        }
        
        return $meeting;
    }

    
    public function update(MeetingRequest $request, $id){
        
        $meeting = Meeting::findOrFail($id);
        
        $data = $request->all();
        
        if($meeting->status == true){
            $validation = Meeting::validateDates($id, $data);
            if(!$validation){
                $error = \Illuminate\Validation\ValidationException::withMessages([
                    'date' => ['Há uma reunião marcada no mesmo horário.'],
                ]);    
                throw $error;
            }
        }
        
        $meeting->update($data);
        
        return $meeting;
    }

    
    public function accept(Request $request, $id){
        
        $data = $request->all();
        
        $meeting = Meeting::findOrFail($id);
        
        $validation = Validator::make($data, [
            'status' => 'boolean',
        ]);
        
        if($validation->fails()){
            return ['errors' => 'Houve algum erro ao realizar a ação'];
        }
        
        if($data['status'] == true){
            $validation = Meeting::validateDates($id, $meeting);
            if(!$validation){
                return ['errors' => 'Há uma reunião marcada no mesmo horário.'];
            }
        }
        
        $meeting->update([
            'status' => $data['status'],
            'new' => 0
        ]);
        
        return $meeting;
    }

    
    public function delete(Request $request, $id){
        
        $meeting = Meeting::findOrFail($id);
        
        $meeting->delete();
        
        return $meeting;
    }

}

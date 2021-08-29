<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Carbon\Carbon;

class Meeting extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'email',
        'subject',
        'date',
        'start',
        'end',
        'status',
        'new',
        'created_at',
        'updated_at',
        'date_format'
    ];

    protected $casts = [
        'date'=>'datetime:d/m/Y',
        'start'=>'datetime:H:i',
        'end'=>'datetime:H:i'
    ];

    public static function validateDates($id, $data){
        
        $new_date = Carbon::parse($data['date'])->format('Y-m-d');
        $new_start = Carbon::parse($data['start'])->format('H:i');
        $new_end = Carbon::parse($data['end'])->format('H:i');
        
        $new_start = Carbon::parse($new_date." ".$new_start)->format("Y-m-d H:i:s");
        $new_end = Carbon::parse($new_date." ".$new_end)->format("Y-m-d H:i:s");
        
        $meetings = Meeting::where('id', '!=', $id)->where('status', true)->get();
        
        $validate = true;
        foreach($meetings as $meeting){
            
            $date = Carbon::parse($meeting->date)->format('Y-m-d');
            $start = Carbon::parse($meeting->start)->format('H:i');
            $end = Carbon::parse($meeting->end)->format('H:i');
            
            $start = Carbon::parse($date." ".$start)->format("Y-m-d H:i:s");
            
            $end = Carbon::parse($date." ".$end)->format("Y-m-d H:i:s");
            
            if( ($new_start >= $start && $new_start < $end) || ($new_end > $start && $new_start < $end) ){
                $validate = false;
            }
        }

        return $validate;
    }

}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Meeting;
use App\Http\Requests\MeetingRequest;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    
    public function login(Request $request){
        $data = $request->all();
        
        $validation = Validator::make($data, [
            'email' => 'required|string|email|max:191',
            'password' => 'required|string|min:6|max:191'
        ]);
        
        if($validation->fails()){
            return $validation->errors();
        }
         
        if(Auth::attempt(['email'=>$data['email'], 'password'=>$data['password']])){
            $user = auth()->user();
            $user->token = $user->createToken($user->email)->accessToken;
        }else{
            return ['status'=>false];
        }
        return $user;
    }

    
    public function getMe(Request $request){
         
        $user = $request->user();
        
        return $user;
    }

}

<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function(){
    Route::post('/login', 'App\Http\Controllers\UserController@login');
    Route::post('/meetings', 'App\Http\Controllers\MeetingController@store');
    Route::get('/meetings', 'App\Http\Controllers\MeetingController@get');
    Route::get('/meetings/{id}', 'App\Http\Controllers\MeetingController@show');
    Route::group(['middleware'=>'auth:api'], function(){
        Route::post('/get-me', 'App\Http\Controllers\UserController@getMe');
        Route::patch('/meetings/{id}', 'App\Http\Controllers\MeetingController@update');
        Route::delete('/meetings/{id}', 'App\Http\Controllers\MeetingController@delete');
        Route::put('/meetings-accept/{id}', 'App\Http\Controllers\MeetingController@accept');
    });
});

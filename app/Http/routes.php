<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/create-route','FONRouteController@createRoute');
Route::get('/route/{route_number?}','FONRouteController@route');




Route::post('/load-olt-cards','FONRouteController@OLTCards');
Route::post('/load-olt-card-ports','FONRouteController@OLTCardPorts');
Route::post('/load-plant-details','FONRouteController@plantDetails');




Route::post('/register-route','FONRouteController@registerRoute');



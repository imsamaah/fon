<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Route;
use App\Http\Requests;
use Session;
class FONRouteController extends Controller
{
	private function OLT()
	{
		$query = DB::table('olt')->get();
		$list = NULL;
		foreach($query as $row)
		{
			$id = $row->id;
			$name = $row->name;
			$list .= "<option value='$id'>$name</option>";
		}
		return $list;
	}
	public function OLTCards(Request $request)
	{
		$query = DB::table('olt_card')->where('olt_id',$request->input('olt_id'))->get();
		$list = NULL;
		foreach($query as $row)
		{
			$id = $row->id;
			$card_number = $row->card_number;
			$list .= "<option value='$id'>$card_number</option>";
		}
		return "<option value='0'>--select card--</option>".$list;
	}	
	public function OLTCardPorts(Request $request)
	{
		$query = DB::table('olt_card_port')->where('olt_card_id',$request->input('olt_card_id'))->get();
		$list = NULL;
		foreach($query as $row)
		{
			$id = $row->id;
			$port = $row->port;
			$bandwidth = $row->bandwidth;
			$max_customers = $row->max_cust;
			$list .= "<option value='$id'>$port - {$bandwidth}:$max_customers</option>";
		}
		return "<option value='0'>--select card port--</option>".$list;
	}
    public function createRoute()
    {
    	$olt = $this->OLT();
    	$route_number = str_random(15);
    	return view('create-route')->with([
    		'olt' => $olt,
    		'route_number' => $route_number,
    		]);
    }





    public function registerRoute(Request $request)
    {
        $insert = Route::create($request->all());
        if ($insert) {
            Session::put('query_message', '<div class="alert alert-success" role="alert">Route registered successfully!</div>');
         }else{
            Session::put('query_message', '<div class="alert alert-danger" role="alert">Sorry, there was an error performing this request!</div>');
         }
         return redirect("/route/{$request->input('route_number')}");
    }

    public function route($route_number)
    {
    	$route = Route::where('route_number',$route_number)->first();
    	return view('route')->with([
    		'route_number' => $route_number,
    		'route' => $route,
    		]);
    }



}














<?php

namespace App\Http\Controllers\scmsp;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DivisionController extends Controller
{
        /*
	Method Name	: index
	Purpose		: load division list
	Param		: no param need
	Date		: 04/15/2019
	Author		: Atiqur Rahman
	*/
	public function index(){
		return View('scmsp.backend.division.list');
	}
        
        /*
	Method Name	: create
	Purpose		: load division create
	Param		: no param need
	Date		: 04/15/2019
	Author		: Atiqur Rahman
	*/
	public function create(){
		return View('scmsp.backend.division.create');
	}
        /*
	Method Name	: edit
	Purpose		: load division edit
	Param		: no param need
	Date		: 04/15/2019
	Author		: Atiqur Rahman
	*/
	public function edit(){
		return View('scmsp.backend.division.edit');
	}
        
        /*
	Method Name	: store
	Purpose		: load division store
	Param		: no param need
	Date		: 04/15/2019
	Author		: Atiqur Rahman
	*/
	public function store(){
		echo "Division Store";
	}
        
        /*
	Method Name	: update
	Purpose		: load division update
	Param		: no param need
	Date		: 04/15/2019
	Author		: Atiqur Rahman
	*/
	public function update(){
		echo "Division Update";
	}
        
         /*
	Method Name	: delete
	Purpose		: load division delete
	Param		: no param need
	Date		: 04/15/2019
	Author		: Atiqur Rahman
	*/
	public function delete(){
		echo "Division Delete";
	}
}
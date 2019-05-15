<?php

namespace App\Http\Controllers\Scmsp;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use App\Model\scmsp\backend\complainDetails\ComplainDetails;
use Illuminate\Support\Facades\Auth;
use App\Model\scmsp\backend\complainType\ComplainType;
use App\Model\scmsp\backend\complainStatus\ComplainStatus;

class ComplainDetailsController extends Controller
{
    /*
	Method Name	: index
	Purpose		: load complain details list
	Param		: no param need
	Date		: 04/16/2019
	Author		: Atiqur Rahman
	*/
	public function index(){
            $list   = ComplainDetails::orderBy('id', 'desc')->get();
            return View('scmsp.backend.complain_details.list', compact('list'));
	}
        
        /*
	Method Name	: create
	Purpose		: load complain details create
	Param		: no param need
	Date		: 04/16/2019
	Author		: Atiqur Rahman
	*/
	public function create(){
		return View('scmsp.backend.complain_details.create');
	}
        /*
	Method Name	: edit
	Purpose		: load complain details edit
	Param		: no param need
	Date		: 04/16/2019
	Author		: Atiqur Rahman
	*/
	public function edit(){
		return View('scmsp.backend.complain_details.edit');
	}
        /*
	Method Name	: store
	Purpose		: load complain details store
	Param		: no param need
	Date		: 04/16/2019
	Author		: Atiqur Rahman
	*/
	public function store(Request $request){
		//$all    =   $request->all();
                //print_r($all);
                //exit();

        $rules  =   [
                'complain_type_id'  => 'required',
                'complainer'        => 'required',
                'complain_details'  => 'required',
                'issued_date'       => 'required',
                'complain_status'   => 'required',
            ];
            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return redirect('admin/complain-details-create')
                            ->withErrors($validator)
                            ->withInput();
            }
            
            $complain_details                      =   new ComplainDetails;
            $complain_details->complain_type_id    =   $request->complain_type_id;
            $complain_details->complainer          =   $request->complainer;
            $complain_details->complain_details    =   $request->complain_details;
            $complain_details->issued_date         =   $request->issued_date;
            $complain_details->complain_status     =   $request->complain_status;
            $complain_details->user_id             =   Auth::user()->id;
            $complain_details->save();
            return redirect('admin/complain-details-list')->with('success', 'Data have been successfully saved.');
	}
        
        /*
	Method Name	: update
	Purpose		: load complain details update
	Param		: no param need
	Date		: 04/16/2019
	Author		: Atiqur Rahman
	*/
	public function update(){
		echo "complain details Update";
	}
        /*
	Method Name	: delete
	Purpose		: load complain details delete
	Param		: no param need
	Date		: 04/16/2019
	Author		: Atiqur Rahman
	*/
	public function delete(){
		echo "complain details Delete";
	}
}

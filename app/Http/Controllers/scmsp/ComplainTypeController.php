<?php

namespace App\Http\Controllers\scmsp;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Validator;
use App\Model\scmsp\backend\complainType\ComplainType;
use Illuminate\Support\Facades\Auth;

class ComplainTypeController extends Controller {
	
	/*
	Method Name	: index
	Purpose		: load complain type list
	Param		: no param need
	Date		: 04/09/2019
	Author		: Atiqur Rahman
	*/
	public function index(){
                $list   = ComplainType::orderBy('name', 'desc')->get();
                /* selected menue data */
                $activeMenuClass    =   'settings';   
                $subMenuClass       =   'complain-type-list';
                return View('scmsp.backend.complain_type.list', compact('list','activeMenuClass','subMenuClass'));
	}
	
	
	/*
	Method Name	: create
	Purpose		: load complain type create
	Param		: no param need
	Date		: 04/09/2019
	Author		: Atiqur Rahman
	*/
	public function create(){
            /* selected menue data */
                $activeMenuClass    =   'settings';   
                $subMenuClass       =   'complain-type-list';
		return View('scmsp.backend.complain_type.create', compact('activeMenuClass','subMenuClass'));
	}
	
	
	/*
	Method Name	: edit
	Purpose		: load complain type edit
	Param		: no param need
	Date		: 04/09/2019
	Author		: Atiqur Rahman
	*/
	public function edit(Request $request){
                $editData   = ComplainType::find($request->id);
                /* selected menue data */
                $activeMenuClass    =   'settings';   
                $subMenuClass       =   'complain-type-list';
                return View('scmsp.backend.complain_type.edit', compact('editData','activeMenuClass','subMenuClass'));
	}
	
	/*
	Method Name	: store
	Purpose		: load complain type store
	Param		: no param need
	Date		: 04/09/2019
	Author		: Atiqur Rahman
	*/
    public function store(Request $request){
        //$all    =   $request->all();
         /* ----------------------------------------------------------
         * check duplicate entry
         * ---------------------------------------------------------
         */
        $checkParam['table'] = "complain_types";
        $checkWhereParam = [
            ['name',       '=', $request->name],
            ['dept_id',    '=', $request->dept_id],
            ['div_id',     '=', $request->div_id],
            ['category_id','=', $request->category_id],
        ];
        $checkParam['where'] = $checkWhereParam;
        $duplicateCheck = check_duplicate_data($checkParam); //check_duplicate_data is a helper method:
        // check is it duplicate or not
        if ($duplicateCheck) {
            return redirect('admin/create-complain-type')
                            ->withInput()
                            ->with('error', 'Failed to save data. Duplicate Entry found.');
        }// end of duplicate checking:
            $rules  =   [
                'name' => 'required',
                'dept_id' => 'required',
                'div_id' => 'required',
                'category_id' => 'required'
            ];
            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return redirect('admin/create-complain-type')
                            ->withErrors($validator)
                            ->withInput();
            }
            
            $complain_type             =   new ComplainType;
            $complain_type->name       =   $request->name;
            $complain_type->dept_id    =   $request->dept_id;
            $complain_type->div_id     =   $request->div_id;
            $complain_type->category_id=   $request->category_id;
            $complain_type->user_id    =   Auth::user()->id;
            $complain_type->save();
            return redirect('admin/complain-type-list')->with('success', 'Data have been successfully saved.');
	}
	
	/*
	Method Name	: update
	Purpose		: load complain type update
	Param		: no param need
	Date		: 04/09/2019
	Author		: Atiqur Rahman
	*/
	public function update(Request $request){
			//$all    =   $request->all();
            /* ----------------------------------------------------------
         * check duplicate entry
         * ---------------------------------------------------------
         */
        $checkParam['table'] = "complain_types";
        $checkWhereParam = [
            ['name',    '=', $request->name],
            ['dept_id', '=', $request->dept_id],
            ['div_id',  '=', $request->div_id],
            ['id',      '!=', $request->edit_id],
            ['category_id','=', $request->category_id],
        ];
        $checkParam['where'] = $checkWhereParam;
        $duplicateCheck = check_duplicate_data($checkParam); //check_duplicate_data is a helper method:
        // check is it duplicate or not
        if ($duplicateCheck) {
            return redirect('admin/complain-type-edit/'.$request->edit_id)
                            ->withInput()
                            ->with('error', 'Failed to save data. Duplicate Entry found.');
        }// end of duplicate checking:
            $rules  =   [
                'name'          => 'required',
                'dept_id'       => 'required',
                'div_id'        => 'required',
                'category_id'   => 'required',
            ];
            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return redirect('admin/complain-type-edit/'.$request->edit_id)
                            ->withErrors($validator)
                            ->withInput();
            }
            
            $complain_type             =   ComplainType::find($request->edit_id);
            $complain_type->name       =   $request->name;
            $complain_type->category_id=   $request->category_id;
            $complain_type->dept_id    =   $request->dept_id;
            $complain_type->div_id     =   $request->div_id;
            $complain_type->user_id    =   Auth::user()->id;
            $complain_type->save();
            return redirect('admin/complain-type-list')->with('success', 'Data have been successfully saved.');
	}
        
        public function delete(Request $request){
		$res        =   ComplainType::where('id',$request->del_id)->delete();
            $feedback   =   [
                'status'    => 'success',
                'message'   => 'Data have successfully deleted.',
                'data'      =>  ''
            ];
            echo json_encode($feedback);
	}
        /*
	Method Name	: get_department_by_division
	Purpose		: load department by division from an ajax call
	Param		: department id need
	Date		: 08/08/2019
	Author		: Tanveer Qureshee
    */    
    function get_category_wise_complain_type(Request $request){
        $departmentdata         =   ComplainType::where('category_id',$request->category_id)->where('dept_id',$request->department_id)->where('div_id',$request->division_id)->get();
        $department_view        =   View::make('scmsp.backend.partial.get_category_wise_complain_type', compact('departmentdata'));
        $feedback = [
                'status'    => 'success',
                'message'   => 'Data found',
                'data'      => $department_view->render(),
            ];
        echo json_encode($feedback);
    }
}

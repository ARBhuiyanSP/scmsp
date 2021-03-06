<?php

namespace App\Http\Controllers\scmsp;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use View;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index(Request $request){
        /* selected menue data */
        $userId             =   Auth::user()->id;
        $role               =   getRoleNameByUserId($userId);
        $userDetails        =   DB::table('users')->where('id', $userId)->first();
        
        $activeMenuClass    =   'dashboard';        
        return View('scmsp.backend.dashboard', compact('activeMenuClass', 'role', 'userDetails'));
    }
    
    public function test_mail() {
        $emails['to'] = 'tanveerqureshee1@gmail.com';
        $emails['from_name'] = 'Saif Customer Care';
        print '<pre>';
        print_r($emails);
        print '</pre>';
        
        $mail = Mail::send('scmsp.mail.testmail', ['title' => 'Title', 'content' => 'Content'], function ($message) use ($emails) {
                    //$message->from($emails['from_address'], $emails['from_name']);
                    $message->to($emails['to']);
                    $message->subject("Complain Test Mail");
                });
                print '<pre>';
                print_r($mail);
                print '</pre>';
                exit;
                
    }
}

@extends('scmsp.backend.layout.app')
@section('title', 'List Department')
@section('content')
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Complain Type Category</a>
        </li>
        <li class="breadcrumb-item active">Complain Type Category List</li>
    </ol>
    <div class='row'>
        <div class='col col-md-12'>
            <a class="btn btn-outline-primary" style="float:right" href="{{ route('admin.complain-type-category-create') }}">Create New</a>            
            <table class="table table-bordered list-table-custom-style" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Division</th>
                            <th>Department</th>
                            <th>Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Division</th>
                            <th>Department</th>
                            <th>Name</th>
                            <th>Action</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <?php
                            $deleteUrl  =   url('admin/complain-type-category-delete');
                            if(!$list->isEmpty()){
                                foreach($list as $data){
                        ?>
                        <tr id='delete_row_id_{{$data->id}}'>
                            <td>
                                <?php
                                    $res    =   get_data_name_by_id('departments',$data->dept_id);
                                    echo (isset($res) && !empty($res) ? $res->name : '');
                                    ?>
                            </td>
                            <td>
                                <?php
                                    $res    =   get_data_name_by_id('divisions',$data->div_id);
                                    echo (isset($res) && !empty($res) ? $res->name : '');
                                ?>
                            </td>
                            <td>{{ $data->name }}</td>
                            <td>
                                <a href="{{ url('admin/complain-type-category-edit/'.$data->id) }}">
                                    <i class="fa fa-edit text-success"></i>
                                </a>
                                <a href="#" onclick="delete_operation('{{ $deleteUrl }}','{{ $data->id }}');">
                                    <i class="fa fa-trash text-danger"></i>
                                </a>
                            </td>
                        </tr>
                        <?php }} ?>
                    </tbody>
                </table>
        </div>
    </div>
</div>
@endsection
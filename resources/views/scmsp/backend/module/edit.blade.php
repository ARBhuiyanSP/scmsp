@extends('scmsp.backend.layout.app')
@section('title', 'Edit Module')
@section('content')
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="{{ route('admin.dashboard') }}">Home</a>
        </li>
        <li class="breadcrumb-item active">Edit Module</li>
    </ol>
    <div class='row'>
        <div class='col col-md-12'>
            <h2>Edit Module</h2>
            @include('scmsp.backend.partial.operation_message')
            <?php
            $sessionEditData   =   Session::get('editData');
            if(isset($sessionEditData) && !empty($sessionEditData)){
                $editData   =   $sessionEditData; 
            }
            ?>
            <form method="POST" action="{{ route('admin.module-update') }}">
                @csrf
                <div class="form-group">
                    <label for="name">Module Name</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter Module Name" name="name" value="{{ old('name',$editData->name) }}">
                    <?php if ($errors->has('name')) { ?>
                    <span class='alert-danger'><?php echo $errors->first('name'); ?></span>
                    <?php } ?>
                </div>
                <input type='hidden' name='edit_id' value="{{$editData->id}}">
                <button type="submit" class="btn btn-info">Save</button>
            </form>
        </div>
    </div>
</div>
@endsection
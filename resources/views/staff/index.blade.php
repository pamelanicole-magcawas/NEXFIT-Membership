@extends('layouts.dashboard')

@section('title', 'Dashboard')
@section('page-title', 'Dashboard')
@section('page-subtitle')
    <span>Welcome back, {{ auth('staff')->user()->full_name }}</span>
@endsection

@section('content')

    <p>This is your staff dashboard. More widgets and summaries will land here soon.</p>

@endsection

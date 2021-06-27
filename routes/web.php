<?php


use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    $pathToFile = "public/goo/index.html";

    return response()->file($pathToFile);
});

Route::post('/create', 'LinkController@createLink');
Route::get('/{alias}', 'LinkController@getLink');

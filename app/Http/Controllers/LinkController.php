<?php

namespace App\Http\Controllers;

use App\Model\Link;
use Illuminate\Http\Request;

class LinkController extends Controller
{

   public function createLink(Request $request){

       $link = $request->input('link');
       $link = (mb_substr($link, 0,4)=='www.')? 'http://'.$link:$link;

       if (strpos($link, 'goo.tj') !== false) {
           return response()->json([
               'err'=>1,
               'msg'=>"Невозможно сократить эту ссылку."
           ]);
       }

       if (!filter_var($link, FILTER_VALIDATE_URL)) {
           return response()->json([
               'err'=>1,
               'msg'=>"Указана некорректная ссылка."
           ]);
       }

       $link = (new Link())->createLink($link);
       $link = 'https://goo.tj/'.$link;

       return response()->json([
           'err'=>0,
           'msg'=>"Успешно",
           'link'=>$link
       ]);
   }


   public function getLink($alias){
       $link = (new Link())->getByAlias($alias);
       if(!$link){
           return abort(404);
       }else{
           return redirect($link->origin);
       }
   }
}

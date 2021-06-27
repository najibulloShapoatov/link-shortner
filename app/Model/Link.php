<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Link extends Model
{
    //
    public function createLink(string $link)
    {

        generate:
        $alias = $this->getRandomString();
        if (Link::where('alias', $alias)->exists()) {
            goto generate;
        }
        $l = new Link();
        $l->origin=$link;
        $l->alias = $alias;
        $l->save();
        return $l->alias;
    }

    function getRandomString($length = 5) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $string = '';

        for ($i = 0; $i < $length; $i++) {
            $string .= $characters[mt_rand(0, strlen($characters) - 1)];
        }

        return $string;
    }

    public function getByAlias($alias)
    {
      return $this->where('alias', $alias)->get()->first();
    }
}

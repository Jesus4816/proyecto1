<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use Illuminate\Http\Request;

class CategoriaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $data = Categoria::all();
        return view('admin.user.index', compact('data'));
    }
    public function store(Request $request)
    {
        if ($request->id > 0) { 
            Categoria::find($request->id)->update($request->all());
        } else {
            Categoria::create($request->all());
        }
        return redirect()->back();
    }

    public function destroy($id)
    {
        Categoria::destroy($id);
        return redirect()->back();
    }
}

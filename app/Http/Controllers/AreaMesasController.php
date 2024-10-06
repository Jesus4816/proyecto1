<?php

namespace App\Http\Controllers;

use App\Models\AreaMesas;
use Illuminate\Http\Request;

class AreaMesasController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $data = AreaMesas::all();
        return view('admin.user.index', compact('data'));
    }
    public function store(Request $request)
    {
        if ($request->id > 0) {
            AreaMesas::find($request->id)->update($request->all());
        } else {
            AreaMesas::create($request->all());
        }
        return redirect()->back();
    }

    public function destroy($id)
    {
        AreaMesas::destroy($id);
        return redirect()->back();
    }
}

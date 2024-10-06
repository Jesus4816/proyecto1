<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use Illuminate\Http\Request;

class ClienteController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $data = Cliente::all();
        return view('admin.cliente.index', compact('data'));
    }
    public function store(Request $request)
    {
        if ($request->id > 0) {
            Cliente::find($request->id)->update($request->all());
        } else {
            Cliente::create($request->all());
        }
        return redirect()->back();
    }

    public function destroy($id)
    {
        Cliente::destroy($id);
        return redirect()->back();
    }
}

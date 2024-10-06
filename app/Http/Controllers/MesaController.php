<?php

namespace App\Http\Controllers;
 
use App\Models\Mesa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MesaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index(Request $request)
    {
        $id_area = base64_decode($request->cod);
        $categoria = DB::table('area_mesa')
        ->select('area_mesa.*', DB::raw('COUNT(mesas.id) as conteo_mesas'))
        ->leftJoin('mesas', function ($join) {
            $join->on('area_mesa.id', '=', 'mesas.id_area')
            ->where('mesas.id_parent', '>', 0);
        })
            ->groupBy('area_mesa.id', 'area_mesa.nombre', 'area_mesa.created_at', 'area_mesa.updated_at')
            ->get(); 
        $data = ($id_area > 0)? $this->obtenerArbolMesas($id_area):$data =  $this->obtenerArbolMesas($categoria[0]->id);  
        return view('admin.mesa.index', compact('data', 'categoria','id_area'));
    }
    public function store(Request $request)
    { 
        if ($request->id > 0) {
            $data = $request->all();
            Mesa::find($request->id)->update($data);
        } else {
            $data = $request->all();
            Mesa::create($data);
        }
        return redirect()->back();
    }

    public function update(Request $request)
    { 
        Mesa::find($request->id)->update(['id_parent' => $request->id_parent]); 
        return response()->json(true);
    }
    public function destroy($id)
    {
        Mesa::destroy($id); 
        return redirect()->back();
    }
    public function destroyparent($id)
    { 
        $padre = Mesa::find($id); 
        if (!$padre) {
            return redirect()->back();
        } 
        Mesa::where('id_parent', $padre->id)->delete(); 
        $padre->delete(); 
        return redirect()->back();
    }
    function obtenerArbolMesas($id_area,$parentId = 0)
    {
        $mesas = Mesa::where('id_area', $id_area)->where('id_parent', $parentId)->get(); 
        foreach ($mesas as $mesa) {
            $mesa->hijos = $this->obtenerArbolMesas($id_area, $mesa->id);
            $mesa->cantidad_hijos = count($mesa->hijos);
        } 
        return $mesas;
    }
}

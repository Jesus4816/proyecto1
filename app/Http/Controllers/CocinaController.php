<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CocinaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $data = DB::table('pedidos as p')
        ->join('mesas AS m', 'p.id_mesa', '=', 'm.id')
            ->select('p.*', 'm.numero_mesa', 'p.created_at')
            ->whereIn('p.estado', ['Pendiente', 'En Preparación'])
            ->get();
        foreach ($data as $item) { 
            $diferencia = Carbon::parse($item->created_at)->diff(Carbon::now());
            $item->minutos_transcurridos = ($diferencia->h > 0) ? $diferencia->format('%h horas') :  $item->minutos_transcurridos = $diferencia->format('%i minutos');
        }
        return view('admin.cocina.index', compact('data'));
    }
    public function store(Request $request)
    {
        return redirect()->back();
    }
    
    public function getPedidos(Request $request)
    {
        if ($request->ajax()){
            $data = DB::table('pedidos as p')
            ->join('mesas AS m', 'p.id_mesa', '=', 'm.id')
            ->select('p.*', 'm.numero_mesa', 'p.created_at')
            ->whereIn('p.estado', ['Pendiente', 'En Preparación'])
            ->get();
            foreach ($data as $item) {
                $diferencia = Carbon::parse($item->created_at)->diff(Carbon::now());
                $item->minutos_transcurridos = ($diferencia->h > 0) ? $diferencia->format('%h horas') :  $item->minutos_transcurridos = $diferencia->format('%i minutos');
            }
            return response()->json($data);
        }
    }
    
    public function destroy($id)
    {

        return redirect()->back();
    }
}

<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use App\Models\Cliente;
use App\Models\Menu;
use App\Models\Mesa;
use App\Models\Pedido;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use TCPDF;

class OrdenController extends Controller
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
        $data = ($id_area > 0) ? $this->obtenerArbolMesas($id_area) : $this->obtenerArbolMesas($categoria[0]->id);
        return view('admin.orden.mesas', compact('data', 'categoria', 'id_area'));
    }
    public function generar_orden(Request $request)
    {
        $data = Menu::all();
        $categoria = Categoria::all();
        $mesa = Mesa::find(base64_decode($request->code));
        $clientes = Cliente::all();
        $pedido = Pedido::where('id_mesa', base64_decode($request->code))->where('estado', '!=', 'finalizado')->first();
        return view('admin.orden.orden', compact('data', 'categoria', 'mesa', 'clientes', 'pedido'));
    }
    public function store(Request $request)
    {
        if ($request->ajax()) {
            if ($request->id > 0) {
                Pedido::find($request->id)->update($request->all());
            } else {
                Pedido::create($request->all());
                Mesa::find($request->id_mesa)->update(['estado' => 0]);
            }
            return response()->json($request->id);
        }
    }
    public function update(Request $request)
    {
        if ($request->ajax()) {
            Pedido::find($request->id)->update(['estado' => $request->estado]);
            return response()->json($request->all());
        }
    }
    public function finalizarPedido(Request $request)
    {
        if ($request->ajax()) {
            Pedido::find($request->id)->update(
                [
                    'id_cliente' => $request->id_cliente,
                    'igv' => $request->igv,
                    'subtotal' => $request->subtotal,
                    'descuento' => $request->descuento,
                    'total' => $request->total,
                    'pago' => $request->pago_con,
                    'vuelto' => ($request->pago_con - $request->total),
                    'tipo_pago' => $request->tipo_pago,
                    'tipo_comprobante' => $request->comprobante,
                    'detalle' => $request->detalle,
                    'estado' => 'finalizado',
                ]
            );
            Mesa::find($request->id_mesa)->update(['estado' => 1]);
            return response()->json($request->all());
        }
    }
    function generateTicket($id)
    {
        $pedido = Pedido::with('cliente')->find($id);
        $productos = json_decode($pedido->detalle); 
        $total = 0; 
        foreach ($productos as $producto) {
            $total += $producto->precio * $producto->cantidad;
        }
 
        $html = view('comprobantes/ticket', compact('productos', 'total', 'pedido'))->render(); 
        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, [80, 200], true, 'UTF-8', false);
 
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('Nombre de la Empresa');
        $pdf->SetTitle('Ticket de Compra');
        $pdf->SetSubject('Ticket');
        $pdf->SetKeywords('TCPDF, PDF, example, test, guide');
 
        $pdf->SetMargins(5, 5, 5);
        $pdf->SetHeaderMargin(0);
        $pdf->SetFooterMargin(0); 
        $pdf->setPrintHeader(false);
 
        $pdf->AddPage();  
        $logo = public_path('assets/images/ww.png');

        $pdf->Image($logo, 30, 10, 20, '', 'PNG', '', 'C', false, 300, '', false, false, 0, false, false, false); 
        $pdf->Ln(28); 
        $pdf->writeHTML($html, true, false, true, false, ''); 
        $pdf->Output('ticket.pdf', 'I');
        return $id;
      
    }

    public function destroy($id)
    {
        Mesa::destroy($id);
        return redirect()->back();
    }

    function obtenerArbolMesas($id_area, $parentId = 0)
    {
        $mesas = Mesa::where('id_area', $id_area)->where('id_parent', $parentId)->get();
        foreach ($mesas as $mesa) {
            $mesa->hijos = $this->obtenerArbolMesas($id_area, $mesa->id);
            $mesa->cantidad_hijos = count($mesa->hijos);
        }
        return $mesas;
    }

}

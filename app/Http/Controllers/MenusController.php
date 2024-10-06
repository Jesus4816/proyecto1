<?php

namespace App\Http\Controllers;
 
use App\Models\Menu;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class MenusController extends Controller
{
   
    public function __construct()
    {
        $this->middleware('auth');
    } 
    public function index(Request $request)
    {
        $id_categ = base64_decode($request->cod);
        if ($id_categ > 0) {
            $data =  Menu::where('id_categ', $id_categ)->get();
        } else {
            $data = Menu::all(); 
        } 
        $categoria = DB::table('categorias_menu')
        ->select('categorias_menu.*', DB::raw('COUNT(menus.id) as conteo_menus'))
        ->leftJoin('menus', function ($join) {
            $join->on('categorias_menu.id', '=', 'menus.id_categ') ;
        })
            ->groupBy('categorias_menu.id', 'categorias_menu.nombre', 'categorias_menu.created_at', 'categorias_menu.updated_at')
            ->get();  
        return view('admin.menu.index', compact('data','categoria'));
    } 
    public function store(Request $request)
    {
        $url = "";
        if ($request->img) { 
            $datosImagen = json_decode($request->img, true);   
            if ($datosImagen) {
                $archivo = $datosImagen['data'];  
                $archivo = base64_decode($archivo);  
                $url = 'menu_' . Str::random(10) . '.png';  
                $img = public_path() . '/img_menu/' . $url;  
                file_put_contents($img, $archivo);  
            }  
        }
        if ($request->id > 0) {
            $data = $request->all(); 
            ($url == "") ? null : $data['img'] = url('img_menu').'/'. $url;
            Menu::find($request->id)->update($data); 
        } else {
            $data=$request->all();
            $data['img'] = url('img_menu') . '/' . $url;
            Menu::create($data);
        }
        return redirect()->back(); 
    } 
    
    public function destroy($id)
    {
        Menu::destroy($id);
        return redirect()->back();
    }
}

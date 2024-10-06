<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    use HasFactory;
    protected $table = 'pedidos';
    protected $fillable = [ 
        'id_cliente',
        'id_mesa',
        'tipo_pago',
        'pago',
        'vuelto',
        'tipo_comprobante',
        'detalle', 
        'subtotal',
        'igv',
        'descuento',
        'total', 
        'estado', 
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
    //aqui quiero relacionar con la tabla clientes
    public function cliente()
    {
        return $this->belongsTo(Cliente::class , 'id_cliente');
    }
}

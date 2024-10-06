<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mesa extends Model
{
    use HasFactory;
    protected $table = 'mesas';
    protected $fillable = [
        'id_area',
        'id_parent',
        'id_espacio',
        'numero_mesa',
        'capacidad', 
        'estado', 
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
    public function children()
    {
        return $this->hasMany(Mesa::class, 'id_parent');
    }

    public function parent()
    {
        return $this->belongsTo(Mesa::class, 'id_parent');
    }
}

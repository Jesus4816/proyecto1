@extends('admin.layouts.app')
@section('styles')
@endsection
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between mb-0">
                <h4 class="mb-sm-0 text-uppercase border-bottom border-primary " style="letter-spacing: 4px;"><b>Pedidos por atender</b> </h4>
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="{{ url('/home') }}">Inicio</a></li>
                        <li class="breadcrumb-item active">pedidos</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="accordion custom-accordionwithicon custom-accordion-border accordion-border-box accordion-primary" id="accordionBordered">
                        @foreach ($data as $key => $item)
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="accordion_{{ $key }}">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#accordion_border_{{ $key }}" aria-expanded="{{ $key === 0 ? 'true' : 'false' }}" aria-controls="accordion_border_{{ $key }}">
                                        <div class="hstack gap-3 flex-wrap">
                                            <div class="text-muted"><i class="las la-couch me-1"></i><b> Mesa N° {{ $item->numero_mesa }}</b></div>
                                            <div class="vr"></div>
                                            <div class="text-muted">Platos : <span class="fw-medium"> <b> {{ count(json_decode($item->detalle)) }} </b> </span></div>
                                            <div class="vr"></div>
                                            <div class="text-muted"><i class="ri-timer-line me-1"></i> <span class="fw-medium"> <b>Hace : ( {{ $item->minutos_transcurridos }})</b> </span></div>
                                            <div class="vr"></div>
                                            <span class="badge badge-label @if ($item->estado == 'Pendiente') bg-danger @else bg-info @endif"><i class="mdi mdi-circle-medium"></i> {{ $item->estado }}</span>
                                            @if ($item->estado == 'Pendiente')
                                                <div class="vr"></div>
                                                <div class="badge rounded-pill bg-warning fs-12 cursor-pointer" onclick="Actualizar_preparar({{ $item->id }})">Preparar</div>
                                            @else
                                                <div class="vr"></div>
                                                <div class="badge rounded-pill bg-success fs-12 cursor-pointer" onclick="Actualizar_listo({{ $item->id }})">Listo</div>
                                            @endif
                                        </div> 
                                    </button>
                                </h2>
                                <div id="accordion_border_{{ $key }}" class="accordion-collapse collapse{{ $key === 0 ? ' show' : '' }}" aria-labelledby="accordion_{{ $key }}" data-bs-parent="#accordionBordered">
                                    <div class="accordion-body">
                                        <div class="table-responsive table-card mt-2 mb-2">
                                            <table class="table table-borderless align-middle mb-0">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 20%" class="fw-medium pt-0 pb-0 px-3 text-primary"> <i class=" ri-restaurant-line"></i> Nombre</th>
                                                        <th style="width: 5%" class="pt-0 pb-0  px-3 text-primary"> Cantidad </th>
                                                        <th style="width: 10%" class="pt-0 pb-0  px-3 text-primary"> Precio </th>
                                                        <th style="width: 15%;" class="pt-0 pb-0 text-end text-primary"> Total </th>
                                                        <th style="width: 50%" class="pt-0 pb-0  px-3 text-primary"> comentario </th>
                                                    </tr>
                                                </thead>
                                                <tbody class="mt-5 " id="tbody_cart">
                                                    @foreach (json_decode($item->detalle) as $item)
                                                        <tr>
                                                            <td class="pt-1 pb-0 px-3"> <b> {{ $item->nombre }}</b> </td>
                                                            <td class="pt-1 pb-0 px-3 text-center"> <b>{{ $item->cantidad }}</b></td>
                                                            <td class="pt-1 pb-0 px-3"> {{ $item->precio }} </td>
                                                            <td class="pt-1 pb-0 px-3 text-end">{{ $item->total }} </td>
                                                            <td class="pt-1 pb-0 px-3 text-muted"> <code>*</code> <b>{{ $item->comentario }}</b></td>
                                                        </tr>
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('scripts')
    <script>
        function Actualizar_preparar(id) {
            let estado = 'En preparación';
            $.ajax({
                url: "{{ route('orden.update') }}",
                method: 'GET',
                data: {
                    id,
                    estado
                },
                beforeSend: function(xmlHttp) {
                    xmlHttp.setRequestHeader("If-Modified-Since", "0");
                    xmlHttp.setRequestHeader("Cache-Control", "no-cache");
                },
                success: function(data) {
                    actualizarContenido();
                }
            });
        }

        function Actualizar_listo(id) {
            let estado = 'Listo';
            $.ajax({
                url: "{{ route('orden.update') }}",
                method: 'GET',
                data: {
                    id,
                    estado
                },
                beforeSend: function(xmlHttp) {
                    xmlHttp.setRequestHeader("If-Modified-Since", "0");
                    xmlHttp.setRequestHeader("Cache-Control", "no-cache");
                },
                success: function(data) {
                    actualizarContenido();
                }
            });
        }

        function actualizarContenido() {
            $.ajax({
                url: "{{ route('getPedidos') }}",
                type: 'GET',
                dataType: 'json',
                beforeSend: function(xmlHttp) {
                    xmlHttp.setRequestHeader("If-Modified-Since", "0");
                    xmlHttp.setRequestHeader("Cache-Control", "no-cache");
                },
                success: function(data) {
                    actualizarAcordeones(data);
                }
            });
        }

        function actualizarAcordeones(data) {
            let contenido = '';
            data.forEach(function(item, key) {
                let detalleItems = JSON.parse(item.detalle);
                let items = '',
                    botones = '',
                    bg = '';
                detalleItems.forEach(function(row, key) {
                    items += `
                        <tr>
                            <td class="pt-1 pb-0 px-3"> <b> ${row.nombre }</b> </td>
                            <td class="pt-1 pb-0 px-3 text-center"> <b>${row.cantidad }</b></td>
                            <td class="pt-1 pb-0 px-3"> ${row.precio } </td>
                            <td class="pt-1 pb-0 px-3 text-end">${row.total } </td>
                            <td class="pt-1 pb-0 px-3 text-muted"> <code>*</code> <b>${row.comentario }</b></td>
                        </tr>
                    `;
                });
                if (item.estado == 'Pendiente') {
                    bg = 'bg-danger';
                    botones = `<div class="vr"></div> <div class="badge rounded-pill bg-warning fs-12 cursor-pointer" onclick="Actualizar_preparar(${item.id})">Preparar</div> `;
                } else {
                    bg = 'bg-info';
                    botones = `<div class="vr"></div> <div class="badge rounded-pill bg-success fs-12 cursor-pointer" onclick="Actualizar_listo(${item.id})"> Listo </div> `;
                }
                contenido += `
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="accordion_${key}">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#accordion_border_${key}" aria-expanded="${ key === 0 ? 'true' : 'false' }" aria-controls="accordion_border_${key}">
                                <div class="hstack gap-3 flex-wrap">
                                    <div class="text-muted"><i class="las la-couch me-1"></i><b> Mesa N° ${item.numero_mesa }</b></div>
                                    <div class="vr"></div>
                                    <div class="text-muted">Items : <span class="fw-medium"> <b> ${ detalleItems.length } </b> </span></div>
                                    <div class="vr"></div>
                                    <div class="text-muted"><i class="ri-timer-line me-1"></i> <span class="fw-medium"> <b>Hace : ( ${item.minutos_transcurridos })</b> </span></div>
                                    <div class="vr"></div>
                                    <span class="badge badge-label ${bg} "><i class="mdi mdi-circle-medium"></i>  ${item.estado }</span>                                     
                                    ${botones}
                                </div>
                            </button>
                        </h2>
                        <div id="accordion_border_${key}" class="accordion-collapse collapse${ key === 0 ? ' show' : '' }" aria-labelledby="accordion_${key}" data-bs-parent="#accordionBordered">
                            <div class="accordion-body">
                                <div class="table-responsive table-card mt-2 mb-2">
                                    <table class="table table-borderless align-middle mb-0">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%" class="fw-medium pt-0 pb-0 px-3 text-primary"> <i class=" ri-restaurant-line"></i> Nombre</th>
                                                <th style="width: 5%" class="pt-0 pb-0  px-3 text-primary"> Cantidad </th>
                                                <th style="width: 10%" class="pt-0 pb-0  px-3 text-primary"> Precio </th>
                                                <th style="width: 15%;" class="pt-0 pb-0 text-end text-primary"> Total </th>
                                                <th style="width: 50%" class="pt-0 pb-0  px-3 text-primary"> comentario </th>
                                            </tr>
                                        </thead>
                                        <tbody class="mt-5 " > 
                                            ${items}
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
            });
            $('#accordionBordered').html(contenido);

        }
        setInterval(actualizarContenido, 60000);
    </script>
@endsection

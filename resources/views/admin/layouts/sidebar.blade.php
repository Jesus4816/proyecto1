<div class="app-menu navbar-menu">
    <div class="navbar-brand-box">
        <a href="index.html" class="logo logo-dark">
            <span class="logo-sm">
                <img src="assets/images/logo-sm.png" alt="" height="22">
            </span>
            <span class="logo-lg">
                <img src="assets/images/logo-dark.png" alt="" height="17">
            </span>
        </a>
        <a href="index.html" class="logo logo-light">
            <span class="logo-sm">
                <img src="assets/images/logo-light.png" class="avatar-xs rounded-circle" alt="" height="12">
            </span>
            <span class="logo-lg">
                <img src="assets/images/logo-light.png" class="avatar-sm rounded-circle" alt="" height="50">
            </span>
        </a>
        <button type="button" class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover" id="vertical-hover">
            <i class="ri-record-circle-line"></i>
        </button>
    </div>
    <div id="scrollbar">
        <div class="container-fluid">
            <div id="two-column-menu">
            </div>
            <ul class="navbar-nav" id="navbar-nav">
                <li class="menu-title"><span data-key="t-menu">Menu</span></li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{ url('home') }}">
                        <i class="ri-home-4-line"></i> <span data-key="t-Home">Home</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{ url('usuario') }}">
                        <i class="ri-user-line"></i> <span data-key="t-Usuarios">Usuarios</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{ url('clientes') }}">
                        <i class="ri-team-line"></i> <span data-key="t-Clientes">Clientes</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{ url('menus') }}">
                        <i class="ri-menu-line"></i> <span data-key="t-Menus">Menus</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{ url('mesas') }}">
                        <i class="ri-table-line"></i> <span data-key="t-Mesas">Mesas</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{ url('orden') }}">
                        <i class="ri-file-list-line"></i> <span data-key="t-Orden">Orden</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{ url('cocina') }}">
                        <i class="ri-restaurant-line"></i> <span data-key="t-Cocina">Cocina</span>
                    </a>
                </li>

            </ul>
        </div>
    </div>
    <div class="sidebar-background"></div>
</div>
<div class="vertical-overlay"></div>

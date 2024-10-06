  <!DOCTYPE html>
  <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">

      <head>
          <meta charset="utf-8" />
          <title> Sistema | @yield('title') </title>
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta name="csrf-token" content="{{ csrf_token() }}">
          <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
          <meta content="Themesbrand" name="author" />
          <!-- App favicon -->
          <link rel="shortcut icon" href="{{ asset('assets/images/logo-light.png') }}">
          @yield('styles')
          <!-- Layout config Js -->
          <script src="{{ asset('assets/js/layout.js') }}"></script>
          <!-- Bootstrap Css -->
          <link href="{{ asset('assets/css/bootstrap.css') }}" rel="stylesheet" type="text/css" />
          <!-- Icons Css -->
          <link href="{{ asset('assets/css/icons.min.css') }}" rel="stylesheet" type="text/css" />
          <!-- App Css-->
          <link href="{{ asset('assets/css/app.css') }}" rel="stylesheet" type="text/css" />

          <script src="{{ asset('assets/js/jquery.min.js') }}"></script>
      </head>

      <body>
          <!-- Begin page -->
          <div id="layout-wrapper">
              @include('admin.layouts.header')
              @include('admin.layouts.sidebar')

              <!-- ============================================================== -->
              <!-- Start right Content here -->
              <!-- ============================================================== -->
              <div class="main-content">
                  <div class="page-content">
                      <div class="container-fluid">
                          @yield('content')
                      </div>
                      <!-- container-fluid -->
                  </div>
                  <!-- End Page-content -->

                  <footer class="footer">
                      <div class="container-fluid">
                          <div class="row">
                              <div class="col-sm-6">
                                  <script>
                                      document.write(new Date().getFullYear());
                                  </script>
                                  © Velzon.
                              </div>
                              <div class="col-sm-6">
                                  <div class="text-sm-end d-none d-sm-block">Design & Develop by Themesbrand</div>
                              </div>
                          </div>
                      </div>
                  </footer>
              </div>
              <!-- end main content-->
          </div>
          <!-- END layout-wrapper -->
          <div class="d-none">
              @include('admin.layouts.config')
          </div>

          <!-- JAVASCRIPT -->
          <script src="{{ asset('assets/libs/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
          <script src="{{ asset('assets/libs/simplebar/simplebar.min.js') }}"></script>
          <script src="{{ asset('assets/libs/node-waves/waves.min.js') }}"></script>
          <script src="{{ asset('assets/libs/feather-icons/feather.min.js') }}"></script>
          <script src="{{ asset('assets/js/pages/plugins/lord-icon-2.1.0.js') }}"></script>
          <script src="{{ asset('assets/js/plugins.js') }}"></script>

          <!-- App js -->
          @yield('scripts')
          <script src="{{ asset('assets/js/app.js') }}"></script>
      </body>

  </html>

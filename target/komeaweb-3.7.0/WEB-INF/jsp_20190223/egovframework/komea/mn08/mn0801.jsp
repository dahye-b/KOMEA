<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<body>
    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">

            	<div class="section-heading mb-5 col-12">
					<h2>통계자료</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100">

					<!-- Tab Start { -->
					<div class="mb-15" >
						<ul class="nav nav-tabs nav-stats" id="nav-tab" role="tablist">
							<li class="nav-item">
								<a class="nav-link rounded-2 active py-10" id="nav-tab-1" data-toggle="tab" href="#nav-1" role="tab" >Marine Equipment Statistics</a>
							</li>
							<li class="nav-item">
								<a class="nav-link rounded-2 py-10" id="nav-tab-2" data-toggle="tab" href="#nav-2" role="tab" >Shipbuilding Statistics</a>
							</li>
						</ul>
						<div class="tab-content  mt-10 pt-10  text-right" >
							<div class="tab-pane fade show active" id="nav-1" role="tabpanel" >
									<a href="#" class="btn-ststs active btn btn-lg rounded-1" data-id="1" >Status of Members</a>
									<a href="#" class="btn-ststs btn btn-lg rounded-1" data-id="2" >Product & Supply</a>
									<a href="#" class="btn-ststs btn btn-lg rounded-1" data-id="3" >Direct exports</a>
							</div>
							<div class="tab-pane fade" id="nav-2" role="tabpanel" >
								<a href="#" class="btn-ststs btn btn-lg rounded-1" data-id="4" >Status and Statistics</a>
							</div>
						</div>
						<!--
						<div class="tab-content mt-10" >
							<div class="container tab-pane fade show active" id="nav-1" role="tabpanel" >
								<div class="row">
									<div class="col-sm-4 py-10 text-center" >
										<a href="#" class="btn-ststs btn btn-light" data-id="1" ><h6>Status of Members</h6></a>
									</div>
									<div class="col-sm-4 py-10 text-center" >
										<a href="#" class="btn-ststs btn btn-light" data-id="2" ><h6>Product & Supply</h6></a>
									</div>
									<div class="col-sm-4 py-10 text-center" >
										<a href="#" class="btn-ststs btn btn-light" data-id="3" ><h6>Direct exports</h6></a>
									</div>
								</div>
							</div>
							<div class="container tab-pane fade" id="nav-2" role="tabpanel" >
								<div class="row">
									<div class="col-sm-4 py-10 text-center" >
										<a href="#" class="btn-ststs btn btn-light" data-id="4" ><h6 >Status and Statistics</h6></a>
									</div>
								</div>
							</div>
						</div>
						-->
					</div>
					<!-- } Tab end -->


					<!-- Statistics 1 tart { -->
					<div class="card" id="ststs-1">
						<div class="card-header">
							<h2 class="card-title text-primary text-center mt-10">Status of Members</h2>
						</div>
						<div class="card-body">
							<p class="card-text text-center">
								<img src="/img/sub-7/sub.7.1.1.jpg" alt="" />
							</p>
						</div>
					</div>
					<!-- } Statistics 1 end -->

					<!-- Statistics 2 tart { -->
					<div class="card collapse" id="ststs-2">
						<div class="card-header">
							<h2 class="card-title text-primary text-center mt-10">Product & Supply</h2>
						</div>
						<div class="card-body">
							<p class="card-text text-center">
								<img src="/img/sub-7/sub.7.1.2.jpg" alt="" />
							</p>
						</div>
					</div>
					<!-- } Statistics 2 end -->

					<!-- Statistics 3 tart { -->
					<div class="card collapse" id="ststs-3">
						<div class="card-header">
							<h2 class="card-title text-primary text-center mt-10">Direct exports</h2>
						</div>
						<div class="card-body">
							<p class="card-text text-center">
								<img src="/img/sub-7/sub.7.1.3.jpg" alt="" />
							</p>
						</div>
					</div>
					<!-- } Statistics 3 end -->

					<!-- Statistics 4 tart { -->
					<div class="card collapse" id="ststs-4">
						<div class="card-header">
							<h2 class="card-title text-primary text-center mt-10">Status and Statistics</h2>
						</div>
						<div class="card-body">
							<p class="card-text text-center">
								<img src="/img/sub-7/sub.7.1.4.jpg" alt="" />
							</p>
						</div>
					</div>
					<!-- } Statistics 5 end -->

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

<script>
$( document ).ready(function() {
	$(".btn-ststs").on('click', function(){
		$(".card").hide();

		$(".btn-ststs").removeClass('active');
		$(this).addClass("active");

		var idx = $(this).attr("data-id");
		$("#ststs-" + idx).show();
		/*
		$("#ststs-" + idx).fadeIn( 1500, function() {
				// Animation complete
		});
		*/
	});
});
</script>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>

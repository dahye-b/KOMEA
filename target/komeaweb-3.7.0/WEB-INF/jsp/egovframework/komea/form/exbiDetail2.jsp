<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					<h5 class="mb-10" ><i class="fas fa-align-justify text-info"></i> 전시회 개최 실적</h5>
					<div class="mb-20">
						<ul class="nav nav-tabs nav-fill">
							<li class="nav-item"><a class="nav-link active" id="siljuk1-tab" data-toggle="tab" href="#siljuk1" >개최규모</a></li>
							<li class="nav-item"><a class="nav-link" id="siljuk2-tab" data-toggle="tab" href="#siljuk2" >참가업체수</a></li>
							<li class="nav-item"><a class="nav-link" id="siljuk3-tab" data-toggle="tab" href="#siljuk3" >한국업체수</a></li>
							<li class="nav-item"><a class="nav-link" id="siljuk4-tab" data-toggle="tab" href="#siljuk4" >참관객수</a></li>
						</ul>
						<div class="tab-content" >
							<div class="tab-pane fade show active text-center" id="siljuk1" role="tabpanel" aria-labelledby="siljuk1-tab">
								개최규모
							</div>
							<div class="tab-pane fade text-center" id="siljuk2" role="tabpanel" aria-labelledby="siljuk2-tab">
								참가업체수
							</div>
							<div class="tab-pane fade text-center" id="siljuk3" role="tabpanel" aria-labelledby="siljuk3-tab">
								한국업체수
							</div>
							<div class="tab-pane fade text-center" id="siljuk4" role="tabpanel" aria-labelledby="siljuk4-tab">
								참관객수
							</div>
						</div>
					</div>

					<h5 class="mb-10" ><i class="fas fa-align-justify text-info"></i> 한국관 참가실적</h5>
					<div class="mb-30">
						<ul class="nav nav-tabs nav-fill">
							<li class="nav-item"><a class="nav-link active" id="chamga1-tab" data-toggle="tab" href="#chamga1" >참가규모</a></li>
							<li class="nav-item"><a class="nav-link" id="chamga2-tab" data-toggle="tab" href="#chamga2" >상담실적</a></li>
							<li class="nav-item"><a class="nav-link" id="chamga3-tab" data-toggle="tab" href="#chamga3" >참가만족도</a></li>
						</ul>
						<div class="tab-content" >
							<div class="tab-pane fade show active text-center" id="chamga1" role="tabpanel" aria-labelledby="chamga1-tab">
								참가규모
							</div>
							<div class="tab-pane fade text-center" id="chamga2" role="tabpanel" aria-labelledby="chamga2-tab">
								상담실적
							</div>
							<div class="tab-pane fade text-center" id="chamga3" role="tabpanel" aria-labelledby="chamga3-tab">
								참가만족도
							</div>
						</div>
					</div>
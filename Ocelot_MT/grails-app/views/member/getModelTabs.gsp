<%@ page import="ocelot.Member" %>
<!DOCTYPE html>

<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'user.label', default: 'Member')}"/>
	<title><g:message code="default.show.label" args="[entityName]"/> Models</title>

</head>

<body>
<div class="page-header">
	<h1><g:message default="Models"/></h1>
</div>

<div>
	<div id="list-model" class="content" role="main">

		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="active"><a href="#my-models" role="tab" data-toggle="tab">My Models</a></li>
			<li><a href="#favourites" role="tab" data-toggle="tab">Favourites</a></li>
			<li><a href="#recents" role="tab" data-toggle="tab">Recents</a></li>
			<li><a href="#temporals" role="tab" data-toggle="tab">Temporals</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">

			<div class="tab-pane active" id="my-models">
				<div class="controls" style="font-style: italic">
					<ul class="one-to-many">
						<table class="table table-striped table-bordered">
							<thead>
							<tr>
								<th><g:message code="model.name.label" default="Name"/></th>
							</tr>
							</thead>
							<tbody>
							<g:each in="${memberInstance?.models?.sort { a, b -> a.name.compareTo(b.name) } ?}" status="i"
									var="model">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

									<td><g:link controller="model" action="show"
												id="${model.id}">${model?.name}</g:link></td>
								</tr>
							</g:each>
							</tbody>
						</table>
					</ul>
				</div>
			</div>

			<div class="tab-pane" id="favourites">

				<div class="controls" style="font-style: italic">
					<ul class="one-to-many">
						<table class="table table-striped table-bordered">
							<thead>
							<tr>
								<th><g:message code="model.name.label" default="Name"/></th>
								<th><g:message code="model.user.label" default="User"/></th>
								<th><g:message code="user.remove.fav" default="Remove"/></th>
							</tr>
							</thead>
							<tbody>
							<g:each in="${memberInstance?.models ?}" status="i" var="model">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

									<g:if test="${model.favourite == true}">

										<td><g:link controller="model" action="show"
													id="${model.id}">${model?.name}</g:link></td>

										<td><g:link controller="member" action="show"
													id="${model?.user?.id}">${model?.user?.login}</g:link></td>

										<td><g:link controller="member" action="unmarkFavourite" id="unmark"
													params="${[userId: memberInstance?.id, modelId: model.id]}">Unmark</g:link></li></td>
									</g:if>

								</tr>
							</g:each>
							</tbody>
						</table>
					</ul>
				</div>
				<g:link class="btn btn-sm btn-purple" action="getModels" id="${memberInstance?.id}">
					<i class="glyphicon glyphicon-star"></i>
					<g:message code="default.button.tabsModels.label" default="Add Favourites"/>
				</g:link>
			</div>

			<div class="tab-pane" id="recents">
				<div class="controls" style="font-style: italic">
					<ul class="one-to-many">
						<table class="table table-striped table-bordered">
							<thead>
							<tr>
								<th><g:message code="model.name.label" default="Name"/></th>
								<th><g:message code="model.lastUpdated.label" default="Last Updated"/></th>
							</tr>
							</thead>
							<tbody>
							<g:each in="${memberInstance?.models?.sort { a, b -> a.lastUpdated.compareTo(b.lastUpdated) }?.reverse()}"
									status="i" var="model">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

									<td><g:link controller="model" action="show"
												id="${model.id}">${model?.name}</g:link></td>

									<td><g:formatDate date="${model?.lastUpdated}"/></td>
								</tr>
							</g:each>
							</tbody>
						</table>
					</ul>
				</div>
			</div>

			<div class="tab-pane" id="temporals">
				<div class="controls" style="font-style: italic">
					<ul class="one-to-many">
						<table class="table table-striped table-bordered">
							<thead>
							<tr>
								<th><g:message code="model.name.label" default="Name"/></th>
							</tr>
							</thead>
							<tbody>
							<g:each in="${memberInstance?.models}" status="i" var="model">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<g:if test="${model.temporal == true}">

										<td><g:link controller="model" action="show"
													id="${model.id}">${model?.name}</g:link>
									</g:if>
								</tr>
							</g:each>
							</tbody>
						</table>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
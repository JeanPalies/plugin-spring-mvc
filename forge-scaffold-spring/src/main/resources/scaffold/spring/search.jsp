<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<span class="search">
	<form:form commandName="search" method="POST">
		@{metawidget}
	
		<span class="buttons">
			<input type="submit" value="Search" class="btn btn-primary" name="search"/>
			<input type="submit" value="Create New" class="btn btn-primary" name="create"/>
		</span>
	</form:form>
</span>

<table class="data-table">
	<thead>
		<tr>
			@{headerMetawidget}
		</tr>
	</thead>
	<tbody>
		<c:forEach items="$${@{entityPlural.toLowerCase()}}" var="@{entity.getName()}">
			<tr>
				@{resultMetawidget}
			</tr>
		</c:forEach>
	</tbody>
</table>

<span class="paginator">
	<c:if test="$${current > 1}">
		<a class="btn btn-primary" href="<c:url value="/@{entityPlural.toLowerCase()}?first=$${(current-2)*max}&max=$${max}"/>">Previous</a>
	</c:if>

	<span>$${first} to $${last} (of $${count})</span>

	<c:if test="$${count > current*max}">
		<a class="btn btn-primary" href="<c:url value="/@{entityPlural.toLowerCase()}?first=$${current*max}&max=$${max}"/>">Next</a>
	</c:if>
</span>
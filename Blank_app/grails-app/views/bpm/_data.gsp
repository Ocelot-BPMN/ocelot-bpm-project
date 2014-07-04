<%@ page import="blank.Bpm" %>


<div class="control-group ${hasErrors(bean: bpmInstance, field: 'name', 'error')}  col-xs-12">

    <label class="control-label" for="name">
        <g:message code="bpm.name.label" default="Name" />
    </label>

    <div class="controls">
        <g:textField name="name" required="" value="${bpmInstance?.name}"/>
    </div>

</div>


<div class="control-group ${hasErrors(bean: bpmInstance, field: 'user', 'error')} required col-xs-12">

    <label class="control-label" for="user">
        <g:message code="bpm.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:textField name="user" required="" value="${bpmInstance?.user?.login}"/>
    </div>

</div>


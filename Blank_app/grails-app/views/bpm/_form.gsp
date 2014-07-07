<%@ page import="blank.Bpm" %>

<div class="control-group ${hasErrors(bean: bpmInstance, field: 'name', 'error')} required col-xs-12">
    <label class="control-label" for="name">
        <g:message code="bpm.name.label" default="Name" />
        <span class="required-indicator">*</span>
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
        <g:select id="user" name="user.id" from="${blank.User.list()}" optionKey="id" required="" value="${bpmInstance?.user?.id}" class="many-to-one"/>

    </div>
</div>

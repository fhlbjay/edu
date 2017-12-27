<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <%@include file="/static/commons/commons.jsp" %>
    <script src="/static/js/promotedStudent.js"></script>
    <title>学员升班留级</title>
</head>
<body style="width:100%;height:100%">
<table id="promoted_datagrid"></table>
<div id="promoted_toolbar">
    <shiro:hasPermission name="promotedStudent:saveOrUpdate">
    <a class="easyui-linkbutton" iconCls="icon-edit" plain="true" data-cmd="edit">编辑</a>
    </shiro:hasPermission>
    <shiro:hasPermission name="promotedStudent:changeAuditState">
    <a id="btn_audit" class="easyui-linkbutton" iconCls="icon-audit" plain="true" data-cmd="audit">审核</a>
    <a id="btn_antiAudit" class="easyui-linkbutton" iconCls="icon-unaudit" plain="true" data-cmd="audit">反审核</a>
    </shiro:hasPermission>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain="true" data-cmd="reload">刷新</a>

    <input class="easyui-combobox"
                data-options="url:'/classGrade/selectAll.do',valueField:'id',textField:'className',panelHeight:'auto',prompt:'班级名称'"
                name="afterClzId">
    <input type="text" class="easyui-datebox" data-options="prompt:'转学开始时间'" name="beginDate"/> ~ <input type="text" data-options="prompt:'转学结束时间'" class="easyui-datebox"
                                                                               name="endDate"/>
    <input type="text" class="easyui-textbox" name="keyword" data-options="prompt:'班级名称'" style="width: 110px; height: 25px;">
    <a class="easyui-linkbutton" iconCls="icon-query" plain="true" data-cmd="searchForEmp">查询</a>

    <a href="javascript:void(0)" id="promoted_mb" class="easyui-menubutton"
       data-options="menu:'#mm',iconCls:'icon-search'">快查</a>
    <div id="mm" style="width:150px;">
        <div data-options="iconCls:'icon-redo'">已审核</div>
        <div data-options="iconCls:'icon-redo'">未审核</div>
        <div class="menu-sep"></div>
        <div data-options="iconCls:'icon-see'">所有</div>
    </div>

    <a class="easyui-linkbutton" iconCls="icon-export" plain="true" data-cmd="exportXls">导出</a>

</div>

<div id="promoted_btns">
    <a class="easyui-linkbutton" iconCls="icon-save" plain="true" data-cmd="save">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain="true" data-cmd="cancel">取消</a>
</div>



<div id="promoted_dialog">
    <form id="promoted_form" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id">
        <table align="center" style="margin-top: 20px" cellspacing="10px" cellpadding="5px">
            <tr>
                <td>学员姓名</td>
                <td><input class="easyui-validatebox" data-options="required:true" name="name" style="width: 165px; height: 28px;"/></td>
            </tr>
            <tr style="height: 10px;"></tr>
            <tr>
                <td>电话</td>
                <td><input class="easyui-validatebox" data-options="required:true" name="tel" style="width: 165px; height: 28px;"/></td>
            </tr>
            <tr style="height: 10px;"></tr>
         <%--   <tr>
                <td>QQ</td>
                <td><input class="easyui-validatebox" data-options="required:true" name="qqNum" style="width: 165px; height: 28px;"/></td>
            </tr>
            <tr style="height: 10px;"></tr>--%>
            <tr>
                <td>转班时间</td>
                <td><input type="text" class="easyui-datebox" required="required" name="promoteOrRepeatDate"></td>
            </tr>
            <tr style="height: 10px;"></tr>
            <tr>
                <td>之前的班级</td>
                <td><input class="easyui-combobox"
                           data-options="url:'/classGrade/selectAll.do',valueField:'id',textField:'className',panelHeight:'auto'"
                           name="classBefore.id"></td>
            </tr>
            <tr style="height: 10px;"></tr>
            <tr>
                <td>流入的班级</td>
                <td><input class="easyui-combobox"
                           data-options="url:'/classGrade/selectAll.do',valueField:'id',textField:'className',panelHeight:'auto'"
                           name="classAfter.id"></td>
            </tr>
            <tr style="height: 10px;"></tr>
            <tr>
                <td>营销人员</td>
                <td><input class="easyui-combobox" name="saleman.id"
                           data-options="url:'/employee/selectByRoleSn.do?sn=SALE',valueField:'id',textField:'realname',panelHeight:'auto'">
                </td>
            </tr>
            <tr style="height: 10px;"></tr>
           <%-- <tr>
                <td>类型</td>
                <td>
                    <select class="easyui-combobox" name="clientType.id" style="width: 165px; height: 28px;"
                            data-options="url:'/systemDictionaryItem/queryBySn.do?sn=clientType',valueField:'id',textField:'name',panelHeight:'auto'">
                    </select>
                </td>
            </tr>--%>
        </table>
    </form>


</div>

</body>
</html>

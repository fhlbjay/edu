<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>

    <%@include file="/static/commons/commons.jsp" %>

    <script src="/static/js/incomeItem.js"></script>
    <title>收款管理</title>
</head>
<body style="width:100%;height:100%">
<table id="incomeItem_datagrid"></table>
<div id="incomeItem_toolbar">
    <shiro:hasPermission name="universitytrace:saveOrUpdate">
    <a class="easyui-linkbutton" data-cmd="add" data-options="plain:true,iconCls:'icon-add'">添加</a>
    <a class="easyui-linkbutton" iconCls="icon-edit" plain="true" data-cmd="edit">编辑</a>
    </shiro:hasPermission>
    <a id="btn_audit" class="easyui-linkbutton" iconCls="icon-audit" plain="true" data-cmd="audit">审核</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain="true" data-cmd="reload">刷新</a>

    班级:<input class="easyui-combobox"
              data-options="url:'/classGrade/selectAll.do',valueField:'className',textField:'className',panelHeight:'auto'"
              name="className">
    转学时间:<input type="text" class="easyui-datebox" name="beginDate"/> ~ <input type="text" class="easyui-datebox"
                                                                               name="endDate"/>
    <input type="text" name="keyword" placeholder="姓名" style="width: 110px; height: 25px;">
    <a class="easyui-linkbutton" iconCls="icon-query" plain="true" data-cmd="searchForEmp">查询</a>


    <a class="easyui-linkbutton" iconCls="icon-export" plain="true" data-cmd="exportXls">导出</a>

</div>

<div id="incomeItem_btns">
    <a class="easyui-linkbutton" iconCls="icon-save" plain="true" data-cmd="save">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain="true" data-cmd="cancel">取消</a>
</div>


<div id="incomeItem_dialog">
    <form id="incomeItem_form" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id">
        <table align="center" style="margin-top: 20px" cellspacing="10px" cellpadding="5px">
            <tr>
                <td>姓名</td>
                <td>
                    <%--这里的编辑其实不是真正意义上的编辑--%>
                    <input class="easyui-combobox"
                           data-options="url:'/formalStudent/selectAll.do',valueField:'id',textField:'name',panelHeight:'auto',onChange:setOwntuition"
                           name="formalstudentId"/>
                </td>
            </tr>
            <tr style="height: 10px;"></tr>
            <tr>
                <td>班级</td>
                <td>
                    <input class="easyui-combobox"
                           data-options="url:'/classGrade/selectAll.do',valueField:'className',textField:'className',panelHeight:'auto'"
                           name="className">
                </td>
            </tr>
            <tr style="height: 10px;"></tr>
            <tr>
                <td>收款时间</td>
                <td><input type="text" class="easyui-datebox" name="inputTime">

            </tr>
            <tr style="height: 10px;"></tr>
            <tr>
                <td>收款金额</td>
                <td>
                    <input type="number" name="inMoney" style="width: 120px;height: 21px;">
                </td>
            </tr>
            <tr style="height: 10px;"></tr>
            <tr>
                <td>支付方式</td>
                <td><input class="easyui-combobox"
                           data-options="url:'/systemDictionaryItem/queryBySn.do?sn=paymode',valueField:'id',textField:'name',panelHeight:'auto'"
                           name="payMode.id" style="width: 165px; height: 28px;"/></td>
            </tr>
            <tr style="height: 10px;"></tr>
            <tr>
                <td>欠款金额</td>
                <td>
                    <input id="item_ownTuition" data-options="panelHeight:'auto'" class="easyui-numberbox"
                           name="ownTuition">
                </td>
            </tr>
            <tr style="height: 10px;"></tr>
            <tr>
                <td>收款人</td>
                <td>
                    <input class="easyui-combobox"
                           data-options="url:'/employee/selectAll.do',valueField:'realname',textField:'realname',panelHeight:'auto'"
                           name="paee">
                </td>
            </tr>
            <tr style="height: 10px;"></tr>
            <tr>
                <td>营销人员</td>
                <td>
                    <input class="easyui-combobox"
                           data-options="url:'/employee/selectByRoleSn.do?sn=SALE',valueField:'realname',textField:'realname',panelHeight:'auto'"
                           name="saleman">
                </td>
            </tr>
            <%--审核状态,--%>
            <tr id="auditor_tr">
                <td>审核人</td>
                <td>
                    <input class="easyui-combobox"
                           data-options="url:'/employee/selectAll.do',valueField:'realname',textField:'realname',panelHeight:'auto'"
                           name="auditor">
                </td>
            </tr>
            <tr>
                <td>备注</td>
                <td><input type="text" name="info" style="width: 120px;height: 21px;">
                </td>
            </tr>

        </table>
    </form>


</div>

</body>
</html>

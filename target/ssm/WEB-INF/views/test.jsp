<%--
  Created by IntelliJ IDEA.
  User: 厦门科长
  Date: 2020/3/26
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>createTable2.html</title>

</head>

<body>

<style type="text/css">
    table{
        border:#00ffff solid 2px;
        border-collapse:collapse;
    }
    td{
        border:#8080ff solid 2px;
        padding:10px;
    }
</style>
<script type="text/javascript">
    var tableNode;
    function createTable(){
        tableNode=document.createElement("table");//获得对象
        tableNode.setAttribute("id","table")
        var row=parseInt(document.getElementsByName("row1")[0].value);//获得行号
        //alert(row);
        if(row<=0 || isNaN(row) ){
            alert("输入的行号错误，不能创建表格，请重新输入：");
            return;
        }
        var cols=parseInt(document.getElementsByName("cols1")[0].value);
        if(isNaN(cols) || cols<=0){
            alert("输入的列号错误，不能创建表格，请重新输入：");
            return;
        }
        //上面确定了 现在开始创建
        for(var x=0;x<row;x++){
            var trNode=tableNode.insertRow();
            for(var y=0;y<cols;y++){
                var tdNode=trNode.insertCell();
                tdNode.innerHTML="单元格"+(x+1)+"-"+(y+1);
            }
        }
        document.getElementById("div1").appendChild(tableNode);//添加到那个位置
    }
    function delRow(){
        //要删除行，必须得到table对象才能删除，所以在创建的时候必须要设置table对象的 id 方便操作
        var tab=document.getElementById("table");//获得table对象
        if(tab==null){
            alert("删除的表不存在！")
            return;
        }
        var rows=parseInt(document.getElementsByName("delrow1")[0].value);//获得要删除的对象
        if(isNaN(rows)){
            alert("输入的行不正确。请输入要删除的行。。。");
            return;
        }
        if (rows >= 1 && rows <= tab.rows.length) {
            tab.deleteRow(rows-1);
        }else{
            alert("删除的行不存在！！");
            return ;
        }

    }
    //删除列要麻烦些， 要通过行来进行删除
    // 一行的cells的长度就是列的个数
    //tab.rows[x].deleteCell(cols-1)
    function delCols(){
        //获得table对象
        var tab=document.getElementById("table");

        if(tab==null){
            alert("删除的表不存在！！");
            return ;
        }
        //获得文本框里面的内容
        var cols=parseInt(document.getElementsByName("delcols1")[0].value);
        //检查是否可靠
        if(isNaN(cols)){
            alert("输入不正确。请输入要输出的列。。");
            return;
        }
        if(!(cols>=1 && cols<tab.rows[0].cells.length)){
            alert("您要删除的行不存在！！");
            return;
        }
        for(var x=0;x<tab.rows.length;x++){//所有的行
            tab.rows[x].deleteCell(cols-1);
        }
    }

    //向指定行列写入文本数据
    function writeTable(){
        var wwwrow1=document.getElementById("wwwrow1").value;
        var wwwcols1=document.getElementById("wwwcols1").value;
        var wwwneirong=document.getElementById("wwwneirong").value;

        //获得table对象
        var tab=document.getElementById("table");
        alert(wwwrow1+'|'+wwwcols1+"|"+wwwneirong);
        var valueTd=document.getElementById("table").rows[wwwrow1].cells[wwwcols1];
        valueTd.innerHTML=wwwneirong;
    }
</script>

行:<input type="text" name="row1"/>
列:<input type="text" name="cols1"/>
<input type="button" value="创建表格"  οnclick="createTable()"/><br/>

<input type="text" name="delrow1"/>
<input type="button" value="删除行" οnclick="delRow()"/><br/>

<input type="text" name="delcols1"/>
<input type="button" value="删除列" οnclick="delCols()"/><br>

行:<input type="text" id="wwwrow1"/>
列:<input type="text" id="wwwcols1"/>
写入内容:<input type="text" id="wwwneirong"/>
<input type="button" value="写入表格"  οnclick="writeTable()"/><br/>


<div id="div1"></div>
<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>
</body>
</html>
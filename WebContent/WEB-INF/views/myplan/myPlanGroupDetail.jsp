<%@page import="java.util.HashMap"%>
<%@page import="groupstudy.model.vo.GroupComment"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="groupstudy.model.vo.GroupStudyRoomAddCategory"%>
<%@page import="groupstudy.model.vo.GroupStudyRoom"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
       GroupStudyRoom gsr = (GroupStudyRoom)request.getAttribute("gsr");
       ArrayList<GroupComment> gcList = (ArrayList<GroupComment>)request.getAttribute("gcList"); 
       String category1 = (String)request.getAttribute("category1");
       String category2 = (String)request.getAttribute("category2");
       int memberCnt = (Integer)request.getAttribute("memberCnt");
       //ArrayList<Member> memberFilepath = (ArrayList<Member>)request.getAttribute("memberFilepath");
       HashMap<String, String> memberIdFileMap = (HashMap<String, String>)request.getAttribute("memberIdFileMap");
       String groupEndDate = gsr.getGroupEndDate();
    %>
    
    <%-- <% groupstudyroom %> --%>
<!DOCTYPE html>
<html>
<head>
 <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap{
        width: 1200px;
        margin: 0 auto;
    }
    .header {
        width: 1200px;
        height: 100px;
        background: green;
    }
    .myplan{
        overflow: hidden;
        font-family: Roboto;
    }
    .leftMenu {
        width: 182px;
        height: 1300px;
        float: left;
    }
    
    .participatingGroup {
        float: left;
    }
    .groupListTitle {
        width: 100%;
        height: 53px;
        text-align: center;
        line-height: 53px;
        color: white;
        font-weight: bold;
        background: #75D701;
    }
    .groupList {
        width: 1018px;
    }
    
    .leftMenuList{
        padding: 0;
        margin: 0;
        list-style-type: none;
        text-indent: 25px;
        line-height: 58px;
    }
    .leftMenuA{
        display: block;
        width: 100%;
        height: 58px;
        color: black;
        font-size: 13px;
        font-weight: bold;
        text-decoration: none;
        border-left: 10px solid white;
    }
    .leftMenuA:hover{
        color: black;
        text-decoration: none;
        border-left: 10px solid #75D701;
    }
    /* ?????? ???????????? ????????? ???????????? */
    .leftMenuList>li:last-child>a{
        border-color: #75D701;
    }
    
    .leftMenuList>li:first-child{
        text-indent: 0;
        text-align: center;
        font-weight: bold;
        font-size: 20px;
    }
    
    .inputComment>form{
       display: flex;
    }
    
    
    
    /* ---------------------------------------------------------- */
    .gl{
       overflow: hidden;
       padding-left: 100px;
    }
    .gl1-1{
       float: left;
    }
    .greenSquare{
       width: 78px;
       height: 36px;
       border-radius: 5px;
       background-color: #3B4E32;
       text-align: center;
       line-height: 36px;
       font-weight: bold;
       font-size: 20px;
       color: white;
    }
    .dDayDiv{
       overflow: hidden;
       width: 600px;
    }
    .gl1-2{
       float: left;
    }
    
    .gl1-1:first-child{ /* ???????????? ?????????????????? ??????????????? */
       margin-right: 30px;
       width: 200px;
    }
    .gl1-2:first-child {
      width: 25%;
   }
   .gl1-2:nth-child(2) {
      width: 40%;
      font-size: 18px;
   }
   .gl1-2:last-child {
      width: 35%;
      text-align: center;
   }
    /* ??????/??????/??????/????????????????????????---------------------------------------------------------- */
   .btnDiv{
      text-align: right;
      height: 50px;
   }
   .btnAll{
      text-align: center;
      display: inline-block;
      margin: 5px;
      color: black;
      border: 1px solid #B4B4B4;
      height: 35px;
      line-height: 35px;
      width: 70px;
      font-family: Roboto;
   }
   .glTitle{
      color: black;
      font-weight: bold;
      text-indent: 100px;
      font-size: 17px;
      height: 30px;
      line-height: 30px;
      font-family: Roboto;
   }
   .gl{
      margin-top: 20px;
      margin-bottom: 50px;
   }
   th{
      height: 20px;
   }
   .commentWrap{
      overflow: hidden;
   }
   .commentList{
      float: left;
   }
   td{
      text-align: center;
   }
   
   .line{
      width: 85%;
      margin: 0;
      margin-left: 75px;
   }
   
   .{
      overflow: scroll;
      height: 200px;
      overflow-x: hidden;
   }
   .attachmentScroll{
      overflow: scroll;
      height: 200px;
      overflow-x: hidden;
   }
   .commentScroll{
      overflow: scroll;
      height: 400px;
      overflow-x: hidden;
   }
   
}
    
</style>
</head>
<body>
    <section>
        <div class="wrap">
            <div class="header">
               <%@ include file="/WEB-INF/views/common/header.jsp"%>
            </div>
            <div class="myplan">
               <div class="groupListTitle" style="font-weight: bold">[ <%=gsr.getGroupTitle() %> ]</div>
                <div class="leftMenu">
                    <ul class="leftMenuList">
                       <li>???????????????</li>
                        <li><a class="leftMenuA" href="/todayPlan?memberNo=<%=m.getMemberNo()%>"><img src="/img/calender2.png" style="margin-right: 10px;">?????? ??????</a></li>
                        <li><a class="leftMenuA" href="/myStudyCalender?memberNo=<%=m.getMemberNo()%>"><img src="/img/day2.png" style="margin-right: 10px;">?????? ?????????</a></li>
                        <li><a class="leftMenuA" href="/myGroupStudyList?memberNo=<%=m.getMemberNo()%>"><img src="/img/group_icon2.png" style="margin-right: 10px;">???????????? ?????????</a></li>
                    </ul>
                </div>
                <div class="participatingGroup">
                    
                    <div class="groupList">
                       <div class="btnDiv">
                          <a href="/myGroupStudyList?memberNo=<%=m.getMemberNo()%>" class="btnAll">????????????</a>
                          <%if(gsr.getGroupManagerNo()==m.getMemberNo()){//????????? ?????? %>
                             <a href="/updateGroupStudyRoomFrm?groupNo=<%=gsr.getGroupNo() %>&category1=<%=category1 %>&category2=<%=category2 %>" class="btnAll">??????</a>
                             <a href="" class="btnAll" id="studyDelete">??????</a><!-- script????????? -->
                          <%}else{ //????????? ??????????????????%>
                             <a href="" class="btnAll" id="studyExit" style="width: 100px;">????????? ?????????</a><!-- script????????? -->
                          <%} %>
                       </div>
                       <div class="gl"><!-- ???????????????????????? -->
                          <div class="gl1-1">
                             <%if(gsr.getFilepath()==null){ %>
                                <img src='/img/basic.png' style="width: 100%; height: 200px; object-fit: contain; border: none;">
                             <%}else{ %>
                                <img src='/upload/groupImg/<%=gsr.getFilepath() %>' style="width: 100%; height: 200px; object-fit: contain; border: none;">
                             <%} %>
                          </div>
                          <div class="gl1-1">
                             <div class="dDayDiv">
                                <div class="gl1-2">
                                   <div class="greenSquare"></div>
                                   <div id="dDayStatus" style="text-indent: 8px;"></div>
                                </div>
                                <div class="gl1-2">
                                   ?????? ?????? : <%=gsr.getGroupStartDate() %><br>
                                   ?????? ?????? : <%=gsr.getGroupEndDate() %>
                                </div>
                                <div class="gl1-2">
                                   <img src="/img/group_icon3.png"><br>
                                   ???????????? : <%=memberCnt %> / <%=gsr.getGroupPersonnel() %>
                                </div>
                             </div>
                             <div>
                                <p style="font-weight: bold; color: black;">????????? ????????????</p>
                                <p class="gcContent" style="border: 1px solid gray; padding-left: 10px; width: 550px;"><%=gsr.getGroupContentBr() %></p>
                             </div>
                          </div>
                       </div>
                       <div class="glTitle">
                          ?????? ????????? ??????
                          <hr class="line">
                       </div>
                       <div class="gl">
                          <div>
                             <p class="gcContent"><%=gsr.getGroupRuleBr() %></p>
                          </div>
                       </div>
                       <div class="glTitle">
                          ?????? ????????? ??????
                          <hr class="line">
                       </div>
                       <div class="gl">
                          <div>
                             <%StringTokenizer tokens = new StringTokenizer(gsr.getGroupExplan(),"_"); %>
                             <%for(int i = 0;tokens.hasMoreElements();i++){ %>
                                   <img src="/img/Vector33.png" style="margin-left: 10px;"> <%=tokens.nextToken() %><br>
                             <%} %>
                          </div>
                       </div>
                       <div class="glTitle" style="overflow: hidden;">
                          <div style="float: left; width: 70%;">?????????</div>
<!-- ???????????? ?????????!!!! -->       <div style="float: left; width: 20%; margin-right: 30px;">
                             <form action="/insertGroupCommentFile" id="uploadFrm" method="post" enctype="multipart/form-data"> 
                                <label for="upBtn" id="uploadLabel" class="btnAll" style="text-indent: 0; font-weight: 100; font-size: 12px;  height: 25px; line-height: 25px;">?????????<input id="upBtn" type="file"  name="filename" onchange="uploadFile(this)" style="display: none;"></label>
                                <input type="hidden" name="commentTitle">
                                <input type="hidden" name="commentWriter" value="<%=m.getMemberId()%>">
                                <input type="hidden" name="groupNo" value="<%=gsr.getGroupNo()%>">
                                <input type="hidden" name="category1" value="<%=category1%>">
                                <input type="hidden" name="category2" value="<%=category2%>">
                             </form>
                          </div>
                       </div>
                       <div class="gl" id="attachment" style="padding-left: 80px;padding-right: 20px; width: 93%; ">
                          <table class="table table-sm">
                        <tr>
                           <th width="10%" style="text-align: center;">?????????</th>
                           <th width="45%" style="text-align: center;">??????</th>
                           <th width="20%" style="text-align: center;">????????????</th>
                           <th width="10%" style="text-align: center;">??????</th>
                        </tr>
                        <%for(GroupComment gc : gcList){ %>
                           <%if(gc.getFilename()!=null){ //??????????????? ??????????????? ?????? ?????? ??????%>
                              <tr>
                                 <td><%=gc.getCommentWriter() %></td>
                                 <td><%=gc.getCommentTitle() %></td>
                                 <td><a href="javascript:fileDownload('<%=gc.getFilename()%>','<%=gc.getFilepath()%>')"><%=gc.getFilename() %></a></td>
                                 <td>
                                    <!-- ????????? ?????????????????? ???????????? ???????????? / ????????? ?????? ?????????????????? -->
                                    <%if(m.getMemberId().equals(gc.getCommentWriter()) || m.getMemberNo()==gsr.getGroupManagerNo()){%>
                                       <a href="javascript:void(0)" style="color: black;" onclick="deleteFile(this,'<%=gc.getCommentNo()%>','<%=gc.getFilepath()%>','<%=gc.getGroupNo()%>','<%=category1%>','<%=category2%>')">??????</a>
                                    <%} %>
                                 </td>
                              </tr>
                           <%} %>
                        <%} %>
                     </table>
                       </div>
                       <div class="glTitle">
                          ??????
                          <hr class="line">
                       </div>
                       <div class="gl" style="padding-left: 70px;">
                          <!-- ?????? ???????????? ??? -->
                          <div class="inputComment">
                        <form action="/insertGroupComment" method="post">
                           <input type="hidden" name="groupNo" value="<%=gsr.getGroupNo()%>"> <!-- ???????????????no -->
                           <input type="hidden" name="commentWriter" value="<%=m.getMemberId()%>"> <!-- ????????? -->
                           <input type='hidden' name='category1' value='<%=category1%>'>
                           <input type='hidden' name='category2' value='<%=category2%>'>
                           <textarea class="form-control rowCheck" name="commentContent" style="resize: none; width: 85%; display: inline-block; outline: none;" maxlength="65" required="required"></textarea> 
                           <button type="submit" class="btn btn-success btn-lg endDayCheck" style="background-color: #3B4E32">??????</button>
                        </form>
                     </div>
                     <!-- ?????? ?????? ?????? ??? ?????? ?????? ?????? / ?????? -->
                     <div id="commentScrollDiv" style="width: 93%; margin-top: 20px;">
                          <%for(GroupComment gc : gcList){ %>
                          <%if(gc.getCommentContent()!=null){ %>
                             <div class="commentListWrap" style="clear:left;">
                           <div class="commentList" style="width: 10%;">
                              <img src="<%=memberIdFileMap.get(gc.getCommentWriter())%>" style="border-radius: 50%; width: 60px; height: 60px;" ><!-- ????????? ??? ??????????????? ??????????????? -->
                           </div>
                           <div class="commentList" style="width: 77%;">
                              <p id="commentWriterP" style="margin: 0;"><%=gc.getCommentWriter() %></p>
                              <p class="oldContent"><%=gc.getCommentContentBr() %></p>
                              <textarea name="commentContent" class="form-control changeComment" style="display: none; resize: none;" required="required"><%=gc.getCommentContent() %></textarea>
                           </div>
                           <%if(m.getMemberId().equals(gc.getCommentWriter()) || m.getMemberNo()==gsr.getGroupManagerNo()){ //???????????? ?????? ???????????? ?????? ?????? ??????/?????? ???????????? || ?????????????????? ?????????????????????%>
                              <div class="commentList" style="width: 13%;">
                                 <%if(m.getMemberId().equals(gc.getCommentWriter())){ %>
                                    <a href="javascript:void(0)" onclick="modifyComment(this,'<%=gc.getCommentNo()%>','<%=gsr.getGroupNo()%>')">??????</a>
                                 <%} %>
                                 <a href="javascript:void(0)" onclick="deleteComment(this,'<%=gc.getCommentNo()%>','<%=gsr.getGroupNo()%>','<%=category1%>','<%=category2%>')">??????</a>
                              </div>
                           <%} %>
                        </div>
                        <%} %>
                     <%} //?????? for??? ?????? ??????%>
                     </div>
                       </div>
                    </div>
                </div>
            </div>
            
      </div>
      <%@ include file="/WEB-INF/views/common/footer.jsp"%>
    </section>
    <script>
       $(function(){
          var countFile = 0;
          var countContent = 0;
          <%for(GroupComment gc : gcList){ %>
             <%if(gc.getFilename()!=null){%>//?????? ??????????????? ??????????????? ??????????????? ??????????????? ??????????????? ????????? ?????? ??? ????????????
                countFile++;
                if(countFile>5){//??????????????? 5???????????? ?????? ??????????????????
                   $("#attachment").addClass("attachmentScroll");
                }
            <%}else if(gc.getCommentContent()!=null){%>//?????? ??????????????? ??????????????? ??????????????? ??????????????? ??????????????? ????????? ?????? ??? ????????????
               countContent++;
               if(countContent>5){//????????? 5???????????? ?????? ????????? ?????????
                   $("#commentScrollDiv").addClass("commentScroll");
                }
            <%}%>
          <%}%>
          
          //???????????? ????????? 5??? ????????? ???????????? ??????????????? ???????????? ??????
          <%if(gcList.size()>5){%>
             $("#attachment").addClass("overAuto");
          <%}%>
          
          //D-Day?????????
          var now = new Date();
          var groupEndDate = '<%=groupEndDate%>';
           var endArray = groupEndDate.split('-');
           var endDate = new Date(endArray[0], endArray[1]-1, endArray[2]);//?????? -1????????????
           var dday = endDate.getTime() - now.getTime();
           dday = Math.floor(dday / (1000 * 60 * 60 * 24))+1;
           if(dday<0){//??????????????? ????????????
              $(".greenSquare").html("??????");
              $("#dDayStatus").html("?????????");
           }else if(dday==0){//D-DAY?????????
              $(".greenSquare").html("D-"+dday);
              $("#dDayStatus").html("D-DAY!");
           }else{
              $(".greenSquare").html("D-"+dday);
              $("#dDayStatus").html("?????????");
           }
           
           //????????? ???????????? confirm
           $("#studyDelete").click(function(){
              if(!confirm("[<%=gsr.getGroupTitle()%>] ???????????? ?????????????????????????")){
                 $("#studyDelete").attr("href","javascript:void(0);");
              }else{
                 $("#studyDelete").attr("href","/deleteGroupStudyRoom?groupNo=<%=gsr.getGroupNo() %>&memberNo=<%=m.getMemberNo() %>");
              }
           });
           //????????? ????????? confirm
           $("#studyExit").click(function(){
              if(!confirm("[<%=gsr.getGroupTitle()%>] ???????????? ??????????????????????")){
                 $("#studyExit").attr("href","javascript:void(0);");
              }else{
                 $("#studyExit").attr("href","/deleteGroupStudyMember?memberNo=<%=m.getMemberNo()%>&groupNo=<%=gsr.getGroupNo() %>&groupTitle=<%=gsr.getGroupTitle()%>");
              }
           });
       });
       
       //????????? ????????? ????????? ?????? ?????? ??????
       $(function(){
          $(".endDayCheck").click(function(e){
             if($("#dDayStatus").html()=="?????????"){
                  alert("?????? ????????? ???????????? ??????????????? ??????????????????");
                  e.preventDefault();
              }
          });
       });
       
       
       //?????????
        //???????????? ?????????(???????????? ????????????)
        $(function(){
           $("#uploadLabel").click(function(e){
              if($("#dDayStatus").html()=="?????????"){   //????????? ???????????? ?????? ????????? ??????
                   alert("?????? ????????? ???????????? ?????? ???????????? ??????????????????");
                   e.preventDefault();
                   return;
               }
              var contentTitle = prompt('????????? ?????? ???????????? ????????? ??????????????????', '');
              if(contentTitle==null){
                 e.preventDefault();
                 return;
              }
              $("input[name=commentTitle]").val(contentTitle);   
           });
           $("#upBtn").click(function(e){
              e.stopPropagation();
           });
        });
       
       
       //filename??? ?????? ????????? ?????? form?????? submit
       function uploadFile(filename){
          $("#uploadFrm").submit(); 
       }
       
       //???????????? ????????????
       function fileDownload(filename,filepath){//??????????????????????????? ????????????????????? ???
         var url = "/groupCommentFileDownload";
         var encFilename = encodeURIComponent(filename);
         var encFilepath = encodeURIComponent(filepath);
         location.href=url+"?filename="+encFilename+"&filepath="+encFilepath;
      }
       
       //???????????? ??????
       function deleteFile(obj, commentNo, filepath, groupNo, category1, category2){
         if(confirm("????????? ?????????????????????????")){
            location.href="/deleteGroupCommentFile?commentNo="+commentNo+"&filepath="+filepath+"&groupNo="+groupNo+"&category1="+category1+"&category2="+category2;
         }
      }
       
       
       //-----------------------------------------------------------------------
       
       
       //????????????
      //???????????? ??????
      function modifyComment(obj, commentNo, groupNo,e){
         if($("#dDayStatus").html()=="?????????"){   //????????? ???????????? ?????? ???????????? ??????
              alert("?????? ????????? ???????????? ?????? ????????? ??????????????????");
              e.preventDefault();
              return;
          }
         $(obj).parent().prev().children("textarea").show();   //textarea??? ???????????? ??????
         $(obj).parent().prev().children("p").hide();   //p????????? ???????????? ??????
         //???????????? -> ??????????????????
         $(obj).html('????????????');
         $(obj).attr('onclick','modifyComplete(this,"'+commentNo+'","'+groupNo+'")');
         //???????????? -> ????????????
         $(obj).next().html('??????');
         $(obj).next().attr('onclick','modifyCancel(this,"'+commentNo+'","'+groupNo+'")');
         $(obj).next().next().hide();
      }
      //???????????? ??????
      function modifyCancel(obj,commentNo,groupNo){
         $(obj).parent().prev().children("textarea").hide();         //textarea??? ????????? ??????
         $(obj).parent().prev().children("p").show();   //p????????? ???????????? ??????
         //???????????? -> ??????
         $(obj).prev().html('??????');
         $(obj).prev().attr('onclick','modifyComment(this,"'+commentNo+'","'+groupNo+'")');
         //?????? -> ??????
         $(obj).html("??????");
         $(obj).attr('onclick','deleteComment(this,"'+commentNo+'","'+groupNo+'")');
         $(obj).next().show();
      }
      //???????????? ??????
      function modifyComplete(obj,commentNo,groupNo){
         var form = $("<form action='/groupCommentUpdate' method='post'></form>");
         form.append($("<input type='text' name='commentNo' value='"+commentNo+"'>"));
         form.append($("<input type='text' name='groupNo' value='"+groupNo+"'>"));
         form.append($("<input type='text' name='category1' value='<%=category1%>'>"));
         form.append($("<input type='text' name='category2' value='<%=category2%>'>"));
         form.append($(obj).parent().prev().children("textarea"));
         $("body").append(form);
         form.submit();
      }
      //??????????????????
      function deleteComment(obj, commentNo, groupNo, category1, category2){
         if(confirm("????????? ?????????????????????????")){
            location.href="/groupCommentDelete?commentNo="+commentNo+"&groupNo="+groupNo+"&category1="+category1+"&category2="+category2;
         }
      }
      
      
      //?????????????????? ????????????
       $(".leftMenuA").hover(function(){
          $(".leftMenuA").attr("style","border-color : white");
          $(this).attr("style","border-color : #75D701");
       },function(){
          $(".leftMenuA").attr("style","border-color : white");
          $(".leftMenuA").eq(2).attr("style","border-color : #75D701");
       });
       
       
       //????????? ?????? / ?????????????????? ??????(groupRule,groupContent)
       //?????? ?????? ?????? (7???????????????)
       $(".rowCheck").keyup(function(){
          var str = $(this).val();
          var str_arr = str.split("\n");  // ????????? ???????????? ?????? 
          var row = str_arr.length;  // row = ??? ??? 
          if(row >7){//????????? ???????????? ??????
             alert("7??? ?????? ????????? ??? ????????????");
             var lastChar = str.slice(0,-1); //??? 
             $(this).val(lastChar);
          }
       });
      
    </script>
</body>
</html>
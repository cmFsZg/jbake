<#include "header.ftl">
	
<#include "menu.ftl">

<div class="page-header">
    <h1>Report ${content.date?string("dd.MM.yyyy")}</h1>
</div>
    
<#if content?? && content.csvValues??> 
    <#assign csvList = content.csvValues>

    <table class="table table-bordered">
        <#list csvList as line>        
            <#if line?is_first>        
                <thead>
                    <tr>
                        <#list line as value>
                            <th scope="col">${value}</th>
                        </#list>        
                    </tr>
                </thead>
            <#else>
                <tbody>


                        <#if line[10] != '0'> 
                            <tr class="bg-danger">
                        <#else>
                            <tr class="bg-success">
                        </#if>

                        <#list line as value>
                            <td>${value}</td>
                        </#list>        
                    </tr>    
                </tbody>
            </#if>
  	     </#list>            
    </table>
</#if>

<#include "footer.ftl"> 
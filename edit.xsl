<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../system.xsl"/>


<xsl:template name="ShowPage" match="/"><head>
<script src="//tinymce.cachefly.net/4.1/tinymce.min.js"></script>
<script>tinymce.init({selector:'textarea', relative_urls: false, remove_script_host: false, convert_urls: false, plugins: "link paste image code media textcolor table", toolbar: ["undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify",
        "bullist numlist outdent indent | forecolor backcolor | link image | table"], image_list: [
		<gethtml data="extendedobject" id="{ROOT/OBJECT/ID}" mode="image-lister" objtype="default"/>
		        {title: 'Example', value: 'example.jpg'}
    ]});</script>
	</head>
    
    <xsl:if test="not(/ROOT/ACCESSRIGHTS/CANEDIT='True' or (/ROOT/ACCESSRIGHTS/CANCREATECHILDREN='True' and /ROOT/OBJECT/ID='$NEW$'))">
	<script>
	//<![CDATA[
		parent.location.replace (".");
	//]]>
	</script>
	</xsl:if>

	<xsl:call-template name="ShowTemplateDetails"/>
    

	<form method="post" name="edit" accept-charset="utf-8" id="edit">
	<xsl:attribute name="action">
	<xsl:value-of select="$ROOTDIR"/>/action.asp
	</xsl:attribute>

	<xsl:call-template name="Show_EditHeader"/>

	<br/>
	<table class="table">
	<input type="hidden"/>
	<input type="hidden" name="ID"><xsl:attribute name="value"><xsl:value-of select="ROOT/OBJECT/ID"/></xsl:attribute></input>
	<input type="hidden" name="PARENTID"><xsl:attribute name="value"><xsl:value-of select="ROOT/PARENT/OBJECT/ID"/></xsl:attribute></input>

	<tr><td valign="top">Name (nav, url):
	</td><td valign="top"><input type="text" style="width: 98%;" name="name"><xsl:attribute name="value"><xsl:value-of select="ROOT/OBJECT/NAME"/></xsl:attribute></input><br/>
    <p class="help-block">The page name that appears in the MENU and URL</p>
    
    </td></tr>
    
    <tr><td valign="top">Page Title:
	</td><td valign="top"><input type="text" style="width: 98%;" name="title"><xsl:attribute name="value"><xsl:value-of select="ROOT/OBJECT/TITLE"/></xsl:attribute></input><br/>
    <p class="help-block">The page title that appears on the page itself</p>
    </td></tr>
	
	<xsl:if test="not(/ROOT/OBJECT/ID='/')">
		<tr><td valign="top">Description:</td><td valign="top"><input type="text" style="width: 98%;" name="description"><xsl:attribute name="value"><xsl:value-of select="ROOT/OBJECT/DESCRIPTION"/></xsl:attribute></input></td></tr>
	</xsl:if>
    
    <tr><td valign="top">Include Styles?
	</td><td valign="top"><input type="checkbox" name="styles" value="yes"><xsl:if test="ROOT/OBJECT/STYLES[not(.='')]"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input>
    <p class="help-block">Not required if framework contains template suppplemental styles, as well as bootstrap.</p>
    </td></tr>
    
    <tr><td valign="top">List Style
	</td><td valign="top">
    <select class="form-control" name="listtype">
        <option value="none"><xsl:if test="ROOT/OBJECT/LISTTYPE='none'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>none</option>
        <option value="portfolio"><xsl:if test="ROOT/OBJECT/LISTTYPE='portfolio'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Portfolio</option>
        <option value="thumbnail"><xsl:if test="ROOT/OBJECT/LISTTYPE='thumbnail'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Thumbnail</option>
        <option value="grid"><xsl:if test="ROOT/OBJECT/LISTTYPE='grid'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Grid</option>
        <option value="basic"><xsl:if test="ROOT/OBJECT/LISTTYPE='basic'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Basic</option>
        <option value="table"><xsl:if test="ROOT/OBJECT/LISTTYPE='table'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Table</option>
        <option value="default"><xsl:if test="ROOT/OBJECT/LISTTYPE='default'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Default</option>
    </select>
    </td></tr>
    
    <tr><td valign="top">Include Galllery?
	</td><td valign="top"><input type="checkbox" name="gallery" value="yes"><xsl:if test="ROOT/OBJECT/GALLERY[not(.='')]"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input>
    </td></tr>
    
    <tr><td valign="top">Use Carousel instead of featured image?
	</td><td valign="top"><input type="checkbox" name="galleryfeat" value="yes"><xsl:if test="ROOT/OBJECT/GALLERYFEAT[not(.='')]"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input>
    <p class="help">This allows having a positioned slider. This can be useful for desigining a homepage, setting the gallery to carousel and selecting the top position and setting the list style to portfolio or thumbnail</p>
    </td></tr>
    
    <tr><td valign="top">Gallery Position
	</td><td valign="top">
    <select class="form-control" name="align">
        <option value="Top"><xsl:if test="ROOT/OBJECT/ALIGN='Top'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Top</option>
        <option value="Right"><xsl:if test="ROOT/OBJECT/ALIGN='Right'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Right</option>
        <option value="Left"><xsl:if test="ROOT/OBJECT/ALIGN='Left'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Left</option>
        <option value="Bottom"><xsl:if test="ROOT/OBJECT/ALIGN='Bottom'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Bottom</option>
    </select>
    </td></tr>
    
    <tr><td valign="top">Gallery Style
	</td><td valign="top">
    <select class="form-control" name="gallerytype">
        <option value="none"><xsl:if test="ROOT/OBJECT/GALLERYTYPE='none'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>None</option>
        <option value="magnific"><xsl:if test="ROOT/OBJECT/GALLERYTYPE='magnific'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Magnific Paginated</option>
        <option value="logo"><xsl:if test="ROOT/OBJECT/GALLERYTYPE='logo'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Logo Grid</option>
        <option value="carousel"><xsl:if test="ROOT/OBJECT/GALLERYTYPE='carousel'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Carousel</option>
        <option value="double"><xsl:if test="ROOT/OBJECT/GALLERYTYPE='double'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Double</option>
        <option value="masonry"><xsl:if test="ROOT/OBJECT/GALLERYTYPE='masonry'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Masonry</option>
        <option value="spangrid"><xsl:if test="ROOT/OBJECT/GALLERYTYPE='spangrid'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>Spanned Grid</option>
    </select>
    </td></tr>
    
    <tr><td valign="top">Thumbnail URL:
	</td><td valign="top"><input type="text" style="width: 98%;" name="thumbnailurl"><xsl:attribute name="value"><xsl:value-of select="ROOT/OBJECT/THUMBNAILURL"/></xsl:attribute></input></td></tr>
      
        <tr><td>Images:</td><td>
		<input type="button" onClick="window.top.location='{$ROOTDIR}{/ROOT/OBJECT/ID}upload3.htm';" value="Upload File" class="btn btn-lg btn-primary"/>
        <hr/>
		</td></tr>
        
        <tr>
        <td valign="top">Text:</td>
		<td valign="top">
			<textarea id="textarea" name="text" rows="20" cols="100"><xsl:value-of select="/ROOT/OBJECT/TEXT" /></textarea>
		</td>
	</tr>
    
	<input type="hidden" name="UniqueName" value="{/ROOT/OBJECT/UNIQUENAME}"/>
	<input type="hidden" name="framework" value="{/ROOT/OBJECT/FRAMEWORK}"/>
	<input type="hidden" name="type" value="{/ROOT/OBJECT/TYPE}"/>
	
	<input type="hidden" name="childtype" value="{/ROOT/OBJECT/CHILDTYPE}"/>
	<input type="hidden" name="sortkey" value="{/ROOT/OBJECT/SORTKEY}"/>
	</table>

	<!--<xsl:call-template name="Show_EditHeader"/>-->
	</form>

	<xsl:if test="/ROOT/OBJECT/ID[.='$NEW$']">
		<script>
		//<![CDATA[
			document.edit.name.select();
		//]]>
		</script>
	</xsl:if>


</xsl:template>

<xsl:template match="/">
	<xsl:call-template name="ShowFramework"/>
</xsl:template>

</xsl:stylesheet>

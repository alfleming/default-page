<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="../system.xsl"/>
<xsl:output method="html" indent="yes"/>


<xsl:template match="/">

<xsl:if test="/ROOT/ACCESSRIGHTS/LOGGEDIN='True' and /ROOT/ACCESSRIGHTS/CANEDIT='True'">
	<div class="panel">
		<div class="container-fluid">
			<div class="row">
            	<div class="col-sm-3">
					<a class="btn btn-sm btn-block btn-success" href="{$ROOTDIR}{/ROOT/OBJECT/ID}/edit.htm"><i class="fa fa-edit"></i> Edit</a>
                </div>
                <div class="col-sm-3">
                	<a class="btn btn-sm btn-block btn-primary"  href="{$ROOTDIR}{/ROOT/OBJECT/ID}/move.htm?sourceid={/ROOT/OBJECT/ID}&amp;pid={/ROOT/OBJECT/ID/PAGEINFO}"><i class="fa fa-share-square"></i> Move</a>
                </div>
                <div class="col-sm-3">
                	<a class="btn btn-sm btn-block btn-info"  href="{$ROOTDIR}{/ROOT/OBJECT/ID}/pageproperties.htm"><i class="fa fa-gears"></i> Advanced</a>
                </div>
                <div class="col-sm-3">
                	<a class="btn btn-sm btn-block btn-danger"  onclick="return confirm_delete('{/ROOT/OBJECT/NAME}');" href="{$ROOTDIR}/action.asp?action=delete&amp;ID={/ROOT/OBJECT/ID}"><i class="fa fa-trash-o"></i> Delete Page</a>
                </div>
			</div>
		</div>
	</div>
</xsl:if>

<xsl:variable name="imagepath"><xsl:value-of select="$ROOTDIR"/>/getimage.asp?id=<xsl:value-of select="ROOT/OBJECT/ID"/>&amp;filename=<xsl:value-of select="ROOT/OBJECT/IMAGE/NAME"/>&amp;mode=<xsl:value-of select="/ROOT/OBJECT/IMAGE/SIZE"/></xsl:variable>

<xsl:variable name="imagealt">
<xsl:choose>
	<xsl:when test="ROOT/OBJECT/IMAGE/ALT[not(.='')]"><xsl:value-of select="ROOT/OBJECT/IMAGE/ALT"/></xsl:when>
    <xsl:otherwise><xsl:value-of select="ROOT/OBJECT/NAME"/></xsl:otherwise>
</xsl:choose>
</xsl:variable>

<xsl:variable name="imagefloat" select="translate(ROOT/OBJECT/IMAGE/ALIGN,$ucase,$lcase)"/>
<xsl:variable name="videofloat" select="translate(ROOT/OBJECT/ALIGN,$ucase,$lcase)"/>


<xsl:if test="/ROOT/OBJECT/STYLES[not(.='')]">
<style scoped="scoped">
.center-block {
  display: block;
  margin-right: auto;
  margin-left: auto;
}
.pull-right {
  float: right !important;
}
.pull-left {
  float: left !important;
}
.hide {
  display: none !important;
}
.show {
  display: block !important;
}
.invisible {
  visibility: hidden;
}
img {
  vertical-align: middle;
}
.img-responsive,
.thumbnail > img,
.thumbnail a > img,
.carousel-inner > .item > img,
.carousel-inner > .item > a > img {
  display: block;
  width: 100% \9;
  max-width: 100%;
  height: auto;
}
.thumbnail {
  display: block;
  padding: 4px;
  margin-bottom: 20px;
  line-height: 1.42857143;
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 4px;
  -webkit-transition: all .2s ease-in-out;
       -o-transition: all .2s ease-in-out;
          transition: all .2s ease-in-out;
}
.thumbnail > img,
.thumbnail a > img {
  margin-right: auto;
  margin-left: auto;
}
a.thumbnail:hover,
a.thumbnail:focus,
a.thumbnail.active {
  border-color: #428bca;
}
.thumbnail .caption {
  padding: 9px;
  color: #333;
}

img[style*="float:left;"], img[style*="float: left;"] {
	margin-right:10px;
	margin-bottom: 10px;
}

img[style*="float:right;"], img[style*="float: right;"] {
	margin-left:10px;
	margin-bottom: 10px;
}

.image-assignment img[style*="float:left"], .image-assignment img[style*="float: left"], .image-assignment img[align*=left], .image-assignment .pull-left img {
  margin: 0;
  margin-right: 15px;
  margin-bottom: 10px;
}

.image-assignment img[style*="float:right"], .image-assignment img[style*="float: right"], .image-assignment img[align*=right], .image-assignment .pull-right img {
  margin: 0;
  margin-left: 15px;
  margin-bottom: 10px;
}

.image-assignment .pull-left.thumbnail img, .image-assignment .thumbnail.pull-left img, image-assignment .pull-right .thumbnail img, .image-assignment .thumbnail.pull-right img {
	margin:0;
}

.image-assignment .pull-left.thumbnail, .image-assignment  .pull-left.thumbnail {
  margin: 0;
  margin-right: 15px;
  margin-bottom: 10px;
}

.image-assignment .pull-right.thumbnail, .image-assignment .pull-right.thumbnail {
  margin: 0;
  margin-left: 15px;
  margin-bottom: 10px;
}

/* Top and Bottom Banner div */

.image-placement {width:100%;display:block; overflow:hidden;}
.image-holder-wide {
	display: inline-block;
    position: relative;
	width:100%
}
	
.image-holder-wide:after {
	content: '';
    display: block;
    margin-top: 60%;
}

.image-holder-wide .image-placement {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
}

/* PORTFOLIO BOX */

.portfolio-box {
    display: block;
    position: relative;
    margin: 0 auto;
    max-width: 650px;
}

.portfolio-box .portfolio-box-caption {
    display: block;
    position: absolute;
    bottom: 0;
    width: 100%;
    height: 100%;
    text-align: center;
    color: #fff;
    opacity: 0;
    background:rgba(0,0,0,0.76);
    -webkit-transition: all .35s;
    -moz-transition: all .35s;
    transition: all .35s;
}

.portfolio-box .portfolio-box-caption .portfolio-box-caption-content {
    position: absolute;
    top: 50%;
    width: 100%;
    text-align: center;
    transform: translateY(-50%);
}

.portfolio-box .portfolio-box-caption .portfolio-box-caption-content .project-category,
.portfolio-box .portfolio-box-caption .portfolio-box-caption-content .project-name {
    padding: 0 15px;
    font-family: 'Open Sans','Helvetica Neue',Arial,sans-serif;
}

.portfolio-box .portfolio-box-caption .portfolio-box-caption-content .project-category {
    text-transform: uppercase;
    font-size: 14px;
    font-weight: 600;
}

.portfolio-box .portfolio-box-caption .portfolio-box-caption-content .project-name {
    font-size: 18px;
}

.portfolio-box:hover .portfolio-box-caption {
    opacity: 1;
}

@media(min-width:768px) {
    .portfolio-box .portfolio-box-caption .portfolio-box-caption-content .project-category {
        font-size: 16px;
    }

    .portfolio-box .portfolio-box-caption .portfolio-box-caption-content .project-name {
        font-size: 22px;
    }
}

/* IMAGE GRID */

.image-grid {
	display: inline-block;
    position: relative;
	width:100%
}
	
.image-grid:after {
	content: '';
    display: block;
    margin-top: 90%;
}

.image-grid .image-carousel-4 {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
}

/* MASONRY GALLERY */

#photos-masonry {
	
  
  
	column-count: 3;
    column-gap: 3px;
    column-width: 33%;
		-moz-column-count:3;
		-moz-column-gap: 3px;
		-moz-column-width: 33%;
		-webkit-column-count:3;
		-webkit-column-gap: 3px;
		-webkit-column-width: 33%;
	line-height: auto
}

@media (max-width: 767px) {
  #photos-masonry {
  -moz-column-count:    2;
  -webkit-column-count: 2;
  column-count:         2;
  }
}
@media (max-width: 400px) {
  #photos-masonry {
  -moz-column-count:    1;
  -webkit-column-count: 1;
  column-count:         1;
  }
}

.image-holder-masonry {
	display: inline-block;
    position: relative;
	width:100%
}
	
.image-holder-masonry:after {
	content: '';
    display: block;
    margin-top: 30%; /* Change this number to change the slider aspect ratio. width = 100% */
}

.image-holder-masonry .image-carousel-3 {
    position: absolute;
	display:block;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
}

.item-masonry {
	position:relative; 
	overflow: hidden;
	margin: 0 0 2px;
    width: 100%;
	display:block;
	content: '';
	height:auto;
	transform: translateZ(0);
}

.item-masonry .hidden-texts {
	
	width:100%;
	background:rgba(153,0,153,0.67);
	color:#FFF;
	opacity: 0;
	position:absolute;
	left:0;
	right:0;
	top:0;
	bottom:0;
	z-index:4;
	visibility:visible;
	overflow: hidden;
}
.item-masonry:hover .hidden-texts {
	opacity: 1;
}

/* Image Holder */

.pull-right.col-sm-6 .image-holder, .pull-left.col-sm-6 .image-holder {
	display: inline-block;
    position: relative;
	width:100%
}
	
.pull-right.col-sm-6 .image-holder:after, .pull-right.col-sm-6 .image-holder:after  {
	content: '';
    display: block;
    margin-top: 90%; 
}

.pull-right.col-sm-6 .image-holder .image-carousel-3 {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
}


</style>
</xsl:if>

<xsl:if test="/ROOT/OBJECT/IMAGE/CAPTION[not(.='')]">
<xsl:choose>
	<xsl:when test="/ROOT/OBJECT/IMAGE/SIZE='1'"><style>.caption-sizer {width:75px;max-width:75px;}</style></xsl:when>
	<xsl:when test="/ROOT/OBJECT/IMAGE/SIZE='2'"><style>.caption-sizer {width:110px;max-width:110px;}</style></xsl:when>
	<xsl:when test="/ROOT/OBJECT/IMAGE/SIZE='3'"><style>.caption-sizer {width:225px;max-width:225px;}</style></xsl:when>
	<xsl:when test="/ROOT/OBJECT/IMAGE/SIZE='6'"><style>.caption-sizer {width:400px;max-width:400px;}</style></xsl:when>
	<xsl:when test="/ROOT/OBJECT/IMAGE/SIZE='8'"><style>.caption-sizer {width:600px;max-width:600px;}</style></xsl:when>
	<xsl:when test="/ROOT/OBJECT/IMAGE/SIZE='9'"><style>.caption-sizer {width:800px;max-width:800px;}</style></xsl:when>
	<xsl:otherwise><style>.caption-sizer {width:<xsl:value-of select="/ROOT/OBJECT/IMAGE/RAWX" disable-output-escaping="yes"/>px;max-width:<xsl:value-of select="/ROOT/OBJECT/IMAGE/RAWX" disable-output-escaping="yes"/>px;}</style></xsl:otherwise>
</xsl:choose>                     	
</xsl:if>

<xsl:if test="ROOT/OBJECT/IMAGE/ALIGN='Top' or ROOT/OBJECT/ALIGN='Top'">
	<div class="image-holder-wide">
<xsl:choose>
    <xsl:when test="ROOT/OBJECT/GALLERYTYPE='carousel'"><gethtml data="extendedobject" id="." mode="gallery-carousel" object="default" /></xsl:when>
    <xsl:when test="ROOT/OBJECT/GALLERYTYPE='double'"><gethtml data="extendedobject" id="." mode="gallery-double" object="default" /></xsl:when>
    <xsl:otherwise><div class="image-placement" style="background:url('{$ROOTDIR}/getimage.asp?id={ROOT/OBJECT/ID}&amp;filename={ROOT/OBJECT/IMAGE/NAME}&amp;mode={ROOT/OBJECT/IMAGE/SIZE}') no-repeat center center; background-size:cover; -webkit-background-size:cover; -moz-background-size:cover; -o-background-size:cover;"></div></xsl:otherwise>
</xsl:choose>

		
	</div>
</xsl:if>
<xsl:choose>
    <xsl:when test="/ROOT/OBJECT/TITLE[not(.='')]"><h1><xsl:value-of select="ROOT/OBJECT/TITLE"/></h1></xsl:when>
    <xsl:otherwise><h1><xsl:value-of select="ROOT/OBJECT/NAME"/></h1></xsl:otherwise>
</xsl:choose>
<xsl:if test="ROOT/OBJECT/IMAGE/ALIGN='Right' or ROOT/OBJECT/IMAGE/ALIGN='Left' or ROOT/OBJECT/ALIGN='Right' or ROOT/OBJECT/ALIGN='Left' or /ROOT/ACCESSRIGHTS/CANEDIT='True'">
<xsl:choose>
	<xsl:when test="/ROOT/ACCESSRIGHTS/LOGGEDIN='True' and /ROOT/ACCESSRIGHTS/CANEDIT='True'">
		<xsl:call-template name="ShowImage">
			<xsl:with-param name="filename" select="/ROOT/OBJECT/IMAGE/NAME"/>
			<xsl:with-param name="ID" select="/ROOT/OBJECT/ID"/>
			<xsl:with-param name="align">center</xsl:with-param>
			<xsl:with-param name="caption"><xsl:value-of select="/ROOT/OBJECT/IMAGE/CAPTION"/></xsl:with-param>
			<xsl:with-param name="mode"><xsl:value-of select="/ROOT/OBJECT/IMAGE/SIZE"/></xsl:with-param>
			<xsl:with-param name="expand"><xsl:value-of select="/ROOT/OBJECT/IMAGE/EXPAND"/></xsl:with-param>
			<xsl:with-param name="rawx"><xsl:value-of select="/ROOT/OBJECT/IMAGE/RAWX"/></xsl:with-param>
			<xsl:with-param name="rawy"><xsl:value-of select="/ROOT/OBJECT/IMAGE/RAWY"/></xsl:with-param>
		</xsl:call-template>
	</xsl:when>
    <xsl:when test="ROOT/OBJECT/GALLERYFEAT[not(.='')] and ROOT/OBJECT/ALIGN='Right' or ROOT/OBJECT/ALIGN='Left'">
    <div class="thumbnail pull-{$videofloat} col-sm-6">
        <xsl:choose>
            <xsl:when test="ROOT/OBJECT/GALLERYTYPE='carousel'"><gethtml data="extendedobject" id="." mode="gallery-carousel" object="default" /></xsl:when>
            <xsl:when test="ROOT/OBJECT/GALLERYTYPE='double'"><gethtml data="extendedobject" id="." mode="gallery-double" object="default" /></xsl:when>
            <xsl:when test="ROOT/OBJECT/GALLERYTYPE='masonry'"><gethtml data="extendedobject" id="." mode="gallery-masonry" object="default" /></xsl:when>
            <xsl:when test="ROOT/OBJECT/GALLERYTYPE='spangrid'"><gethtml data="extendedobject" id="." mode="gallery-spangrid" object="default" /></xsl:when>
            <xsl:otherwise><gethtml data="extendedobject" id="." mode="gallery-magnific" object="default" /></xsl:otherwise>
        </xsl:choose>
    	
    </div>
    </xsl:when>
    <xsl:when test="/ROOT/OBJECT/IMAGE/EXPAND='Url' and not(ROOT/OBJECT/GALLERYFEAT[not(.='')])">
    <xsl:if test="/ROOT/OBJECT/IMAGE/FEATURED='yes'">
		<div class="image-assignment">
        <a href="{ROOT/OBJECT/IMAGE/URL}"><xsl:if test="ROOT/OBJECT/IMAGE/NEWWINDOW[not(.='')]"><xsl:attribute name="target">_blank</xsl:attribute></xsl:if>
        <div class="thumbnail pull-{$imagefloat}">
            <img src="{$ROOTDIR}/getimage.asp?id={ROOT/OBJECT/ID}&amp;filename={ROOT/OBJECT/IMAGE/NAME}&amp;mode={ROOT/OBJECT/IMAGE/SIZE}" class="img-responsive" alt="{$imagealt}"/>
            <xsl:if test="ROOT/OBJECT/IMAGE/CAPTION[not(.='')]">
                <div class="caption caption-sizer"><xsl:value-of select="ROOT/OBJECT/IMAGE/CAPTION" disable-output-escaping="yes"/></div>
            </xsl:if>
        </div>
        </a>
    </div>
    </xsl:if>
	</xsl:when>
    <xsl:when test="/ROOT/OBJECT/IMAGE/EXPAND='True' and not(ROOT/OBJECT/GALLERYFEAT[not(.='')])">
    <xsl:if test="/ROOT/OBJECT/IMAGE/FEATURED='yes'">
		<div class="image-assignment">
        <a href="{$ROOTDIR}/getimage.asp?id={ROOT/OBJECT/ID}&amp;filename={ROOT/OBJECT/IMAGE/NAME}&amp;mode=0" class="gallery-popup-link">
        <div class="thumbnail pull-{$imagefloat}">
            <img src="{$ROOTDIR}/getimage.asp?id={ROOT/OBJECT/ID}&amp;filename={ROOT/OBJECT/IMAGE/NAME}&amp;mode={ROOT/OBJECT/IMAGE/SIZE}" class="img-responsive" alt="{$imagealt}"/>
            <xsl:if test="ROOT/OBJECT/IMAGE/CAPTION[not(.='')]">
                <div class="caption caption-sizer"><xsl:value-of select="ROOT/OBJECT/IMAGE/CAPTION" disable-output-escaping="yes"/></div>
            </xsl:if>
        </div>
        </a>
    </div>
    </xsl:if>
	</xsl:when>
	<xsl:when test="not(ROOT/OBJECT/GALLERYFEAT[not(.='')])">
    <xsl:if test="/ROOT/OBJECT/IMAGE/FEATURED='yes'">
	<div class="image-assignment">
        <div class="thumbnail pull-{$imagefloat}">
            <img src="{$ROOTDIR}/getimage.asp?id={ROOT/OBJECT/ID}&amp;filename={ROOT/OBJECT/IMAGE/NAME}&amp;mode={ROOT/OBJECT/IMAGE/SIZE}" class="img-responsive" alt="{$imagealt}"/>
            <xsl:if test="ROOT/OBJECT/IMAGE/CAPTION[not(.='')]">
                <div class="caption caption-sizer"><xsl:value-of select="ROOT/OBJECT/IMAGE/CAPTION" disable-output-escaping="yes"/></div>
            </xsl:if>
        </div>
    </div>
    </xsl:if>
    </xsl:when>
    </xsl:choose>
</xsl:if>         
<xsl:value-of select="ROOT/OBJECT/TEXT" disable-output-escaping="yes"/>
<xsl:if test="ROOT/OBJECT/GALLERY[not(.='')] and ROOT/OBJECT/ALIGN='Bottom'"> 
    <div class="clearfix"></div>
    <div class="image-holder-wide">
        <xsl:choose>
            <xsl:when test="ROOT/OBJECT/GALLERYTYPE='carousel'"><gethtml data="extendedobject" id="." mode="gallery-carousel" object="default" /></xsl:when>
            <xsl:when test="ROOT/OBJECT/GALLERYTYPE='double'"><gethtml data="extendedobject" id="." mode="gallery-double" object="default" /></xsl:when>
            <xsl:otherwise><div class="image-placement" style="background:url('{$ROOTDIR}/getimage.asp?id={ROOT/OBJECT/ID}&amp;filename={ROOT/OBJECT/IMAGE/NAME}&amp;mode={ROOT/OBJECT/IMAGE/SIZE}') no-repeat center center; background-size:cover; -webkit-background-size:cover; -moz-background-size:cover; -o-background-size:cover;"></div></xsl:otherwise>
        </xsl:choose>
    </div>
</xsl:if> 

  

<div class="clearfix"></div>     
        


<xsl:if test="ROOT/OBJECT/GALLERY[not(.='')]"> 
<div class="clearfix"></div>
<xsl:choose>
	<xsl:when test="ROOT/OBJECT/GALLERYTYPE='none'"></xsl:when>
	<xsl:when test="ROOT/OBJECT/GALLERYTYPE='magnific'"><gethtml data="extendedobject" id="." mode="gallery-magnific" object="default" /></xsl:when>
    <xsl:when test="ROOT/OBJECT/GALLERYTYPE='masonry'"><gethtml data="extendedobject" id="." mode="gallery-masonry" object="default" /></xsl:when>
    <xsl:when test="ROOT/OBJECT/GALLERYTYPE='spangrid'"><gethtml data="extendedobject" id="." mode="gallery-spangrid" object="default" /></xsl:when>
    <xsl:when test="ROOT/OBJECT/GALLERYTYPE='logo'"><gethtml data="extendedobject" id="." mode="gallery-logo" object="default" /></xsl:when>
    <xsl:otherwise><gethtml data="extendedobject" id="." mode="gallery-magnific" object="default" /></xsl:otherwise>
</xsl:choose>
</xsl:if> 

<xsl:if test="ROOT/OBJECT/GALLERY[not(.='')] and not(ROOT/OBJECT/GALLERYFEAT[not(.='')])"> 
<div class="clearfix"></div>
<xsl:choose>
    <xsl:when test="ROOT/OBJECT/GALLERYTYPE='carousel'"><gethtml data="extendedobject" id="." mode="gallery-carousel" object="default" /></xsl:when>
    <xsl:when test="ROOT/OBJECT/GALLERYTYPE='double'"><gethtml data="extendedobject" id="." mode="gallery-double" object="default" /></xsl:when>
</xsl:choose>
</xsl:if> 

<xsl:if test="/ROOT/ACCESSRIGHTS/LOGGEDIN='True'">
    <div class="container-fluid">
    	<div class="row">
            <div class="col-sm-12">
                <xsl:call-template name="ShowNewHeader">
                <xsl:with-param name="childtype" select="/ROOT/OBJECT/CHILDTYPE"/>
                <xsl:with-param name="ID" select="/ROOT/OBJECT/ID"/>
                </xsl:call-template>
            </div>
        </div>
    </div>
</xsl:if>


<xsl:if test="/ROOT/CHILDREN/OBJECT">
<xsl:choose>
	<xsl:when test="ROOT/OBJECT/LISTTYPE='none'"></xsl:when>
	<xsl:when test="ROOT/OBJECT/LISTTYPE='portfolio'"><gethtml data="extendedobject" id="." mode="default-portfolio" object="default"/></xsl:when>
    <xsl:when test="ROOT/OBJECT/LISTTYPE='thumbnail'"><gethtml data="extendedobject" id="." mode="default-thumbnail" object="default"/></xsl:when>
    <xsl:when test="ROOT/OBJECT/LISTTYPE='grid'"><gethtml data="extendedobject" id="." mode="default-grid" object="default"/></xsl:when>
    <xsl:when test="ROOT/OBJECT/LISTTYPE='table'"><gethtml data="extendedobject" id="." mode="default-table" object="default"/></xsl:when>
    <xsl:when test="ROOT/OBJECT/LISTTYPE='basic'"><gethtml data="extendedobject" id="." mode="default-basic" object="default"/></xsl:when>
    <xsl:otherwise><gethtml data="extendedobject" id="." mode="default-list" object="default"/></xsl:otherwise>
</xsl:choose>
</xsl:if>


</xsl:template>

<xsl:template name="ShowPage"></xsl:template>

</xsl:stylesheet>

	
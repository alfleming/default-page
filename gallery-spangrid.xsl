<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt">

<xsl:import href="../system.xsl"/>

<xsl:template match="/">
<style scoped="scoped">
.row-padder {
    margin-bottom: 2px;
}
.row-padder  > [class*='col-'] {
    padding-right:1px;
    padding-left:1px;
}


.image-grid-holder {
	display: inline-block;
    position: relative;
	width:100%
}
	
.image-grid-holder:after {
	content: '';
    display: block;
    height:220px
}

@media (min-width:768px) and (max-width:990px) {
	.image-grid-holder:after {
	content: '';
    display: block;
    height:290px
}
}
@media (max-width:767px) {
	.image-grid-holder:after {
	content: '';
    display: block;
    height:300px;
}
}


.image-grid-holder .image-carousel-4 {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
}
.grid-caption {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
	background:rgba(0,0,0,0.12);
	color:#FFF;
	text-align:center;
	padding:30px auto;
}
.image-grid-holder:hover .grid-caption {
	background:rgba(153,0,0,0.87);
	transition: ease 0.5s;
}
.grid-caption h3 {
	margin-top:180px;
	text-transform:uppercase;
	font-weight:700;
}

@media (min-width:768px) and (max-width:990px) {
	.grid-caption h3 {
	margin-top:120px;
	text-transform:uppercase;
	font-weight:700;
}
}
@media (max-width:767px) {
	.grid-caption h3 {
	margin-top:120px;
	text-transform:uppercase;
	font-weight:700;
}
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

.image-assignment .pull-left .thumbnail img, .image-assignment .thumbnail.pull-left img, image-assignment .pull-right .thumbnail img, .image-assignment .thumbnail.pull-right img {
margin:0;
}

.image-assignment .pull-left .thumbnail, .image-assignment  .pull-left.thumbnail {
  margin: 0;
  margin-right: 15px;
  margin-bottom: 10px;
}

.image-assignment .pull-right .thumbnail, .image-assignment .pull-right.thumbnail {
  margin: 0;
  margin-left: 15px;
  margin-bottom: 10px;
}

</style>



	<xsl:variable name="items">
		<ROOT><xsl:copy-of select="/ROOT/SETTINGS"/><xsl:copy-of select="/ROOT/ACCESSRIGHTS"/><xsl:copy-of select="/ROOT/OBJECT"/></ROOT>
		<xsl:for-each select="/ROOT/OBJECT/IMAGE">
			<xsl:sort select="SORTKEY" data-type="number"/>
			<xsl:copy-of select="."/>
		</xsl:for-each>
	</xsl:variable>
    
    
    
    <div class="row row-padder">

              <xsl:for-each select="msxsl:node-set($items)/IMAGE">
              	<xsl:variable name="numbered" select="position()"/>
                    
                <xsl:if test="(position() &gt; 0) and (position() &lt; 4)">
                <div class="col-sm-3"><xsl:attribute name="class"><xsl:choose><xsl:when test="SPAN[not(.='')]">col-sm-6</xsl:when><xsl:otherwise>col-sm-3</xsl:otherwise></xsl:choose></xsl:attribute>
                        <a href="{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=0" title="{CAPTION}" class="gallery-popup-link"><div class="image-grid-holder">
                            <div class="image-carousel-4" style="background:url('{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=6') no-repeat center center; background-size:cover; -webkit-background-size:cover; -moz-background-size:cover; -o-background-size:cover;">
                            </div>
                            <div class="grid-caption"><h3><xsl:value-of select="CAPTION" disable-output-escaping="yes"/></h3></div>
                        </div> 
                        </a>
                   </div>
                </xsl:if>
            </xsl:for-each>
     </div> 
     
     <div class="row row-padder">

              <xsl:for-each select="msxsl:node-set($items)/IMAGE">
              	<xsl:variable name="numbered" select="position()"/>
                    
                <xsl:if test="(position() &gt; 3) and (position() &lt; 7)">
                <div class="col-sm-3"><xsl:attribute name="class"><xsl:choose><xsl:when test="SPAN[not(.='')]">col-sm-6</xsl:when><xsl:otherwise>col-sm-3</xsl:otherwise></xsl:choose></xsl:attribute>
                        <a href="{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=0" title="{CAPTION}" class="gallery-popup-link"><div class="image-grid-holder">
                            <div class="image-carousel-4" style="background:url('{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=6') no-repeat center center; background-size:cover; -webkit-background-size:cover; -moz-background-size:cover; -o-background-size:cover;">
                            </div>
                            <div class="grid-caption"><h3><xsl:value-of select="CAPTION" disable-output-escaping="yes"/></h3></div>
                        </div> 
                        </a>
                   </div>
                </xsl:if>
            </xsl:for-each>
     </div>
     
     <div class="row row-padder">

              <xsl:for-each select="msxsl:node-set($items)/IMAGE">
              	<xsl:variable name="numbered" select="position()"/>
                    
                <xsl:if test="(position() &gt; 6) and (position() &lt; 10)">
                <div class="col-sm-3"><xsl:attribute name="class"><xsl:choose><xsl:when test="SPAN[not(.='')]">col-sm-6</xsl:when><xsl:otherwise>col-sm-3</xsl:otherwise></xsl:choose></xsl:attribute>
                        <a href="{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=0" title="{CAPTION}" class="gallery-popup-link"><div class="image-grid-holder">
                            <div class="image-carousel-4" style="background:url('{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=6') no-repeat center center; background-size:cover; -webkit-background-size:cover; -moz-background-size:cover; -o-background-size:cover;">
                            </div>
                            <div class="grid-caption"><h3><xsl:value-of select="CAPTION" disable-output-escaping="yes"/></h3></div>
                        </div> 
                        </a>
                   </div>
                </xsl:if>
            </xsl:for-each>
     </div> 
     
     <div class="row row-padder">

              <xsl:for-each select="msxsl:node-set($items)/IMAGE">
              	<xsl:variable name="numbered" select="position()"/>
                    
                <xsl:if test="(position() &gt; 9) and (position() &lt; 13)">
                <div class="col-sm-3"><xsl:attribute name="class"><xsl:choose><xsl:when test="SPAN[not(.='')]">col-sm-6</xsl:when><xsl:otherwise>col-sm-3</xsl:otherwise></xsl:choose></xsl:attribute>
                        <a href="{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=0" title="{CAPTION}" class="gallery-popup-link"><div class="image-grid-holder">
                            <div class="image-carousel-4" style="background:url('{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=6') no-repeat center center; background-size:cover; -webkit-background-size:cover; -moz-background-size:cover; -o-background-size:cover;">
                            </div>
                            <div class="grid-caption"><h3><xsl:value-of select="CAPTION" disable-output-escaping="yes"/></h3></div>
                        </div> 
                        </a>
                   </div>
                </xsl:if>
            </xsl:for-each>
     </div>
     
     <div class="row row-padder">

              <xsl:for-each select="msxsl:node-set($items)/IMAGE">
              	<xsl:variable name="numbered" select="position()"/>
                    
                <xsl:if test="(position() &gt; 12) and (position() &lt; 16)">
                <div class="col-sm-3"><xsl:attribute name="class"><xsl:choose><xsl:when test="SPAN[not(.='')]">col-sm-6</xsl:when><xsl:otherwise>col-sm-3</xsl:otherwise></xsl:choose></xsl:attribute>
                        <a href="{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=0" title="{CAPTION}" class="gallery-popup-link"><div class="image-grid-holder">
                            <div class="image-carousel-4" style="background:url('{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=6') no-repeat center center; background-size:cover; -webkit-background-size:cover; -moz-background-size:cover; -o-background-size:cover;">
                            </div>
                            <div class="grid-caption"><h3><xsl:value-of select="CAPTION" disable-output-escaping="yes"/></h3></div>
                        </div> 
                        </a>
                   </div>
                </xsl:if>
            </xsl:for-each>
     </div> 
     
     <div class="row row-padder">

              <xsl:for-each select="msxsl:node-set($items)/IMAGE">
              	<xsl:variable name="numbered" select="position()"/>
                    
                <xsl:if test="(position() &gt; 15) and (position() &lt; 19)">
                <div class="col-sm-3"><xsl:attribute name="class"><xsl:choose><xsl:when test="SPAN[not(.='')]">col-sm-6</xsl:when><xsl:otherwise>col-sm-3</xsl:otherwise></xsl:choose></xsl:attribute>
                        <a href="{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=0" title="{CAPTION}" class="gallery-popup-link"><div class="image-grid-holder">
                            <div class="image-carousel-4" style="background:url('{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=6') no-repeat center center; background-size:cover; -webkit-background-size:cover; -moz-background-size:cover; -o-background-size:cover;">
                            </div>
                            <div class="grid-caption"><h3><xsl:value-of select="CAPTION" disable-output-escaping="yes"/></h3></div>
                        </div> 
                        </a>
                   </div>
                </xsl:if>
            </xsl:for-each>
     </div> 
     
     <div class="row row-padder">

              <xsl:for-each select="msxsl:node-set($items)/IMAGE">
              	<xsl:variable name="numbered" select="position()"/>
                    
                <xsl:if test="(position() &gt; 18) and (position() &lt; 22)">
                <div class="col-sm-3"><xsl:attribute name="class"><xsl:choose><xsl:when test="SPAN[not(.='')]">col-sm-6</xsl:when><xsl:otherwise>col-sm-3</xsl:otherwise></xsl:choose></xsl:attribute>
                        <a href="{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=0" title="{CAPTION}" class="gallery-popup-link"><div class="image-grid-holder">
                            <div class="image-carousel-4" style="background:url('{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=6') no-repeat center center; background-size:cover; -webkit-background-size:cover; -moz-background-size:cover; -o-background-size:cover;">
                            </div>
                            <div class="grid-caption"><h3><xsl:value-of select="CAPTION" disable-output-escaping="yes"/></h3></div>
                        </div> 
                        </a>
                   </div>
                </xsl:if>
            </xsl:for-each>
     </div> 

</xsl:template>

<xsl:template name="ShowPage" ></xsl:template>

</xsl:stylesheet>

	
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:import href="../system.xsl"/>

<xsl:template match="/">
    <div class="container-fluid">
	<div class="row">
        <xsl:for-each select="/ROOT/CHILDREN/OBJECT">
            <xsl:sort select="SORTKEY" data-type="number"/>
            <xsl:if test="(position() &gt; 0) and (position() &lt; 4)">
            <xsl:variable name="buttontexts">
            	<xsl:choose>
                	<xsl:when test="BUTTON[not(.='')]"><xsl:value-of select="BUTTON"/></xsl:when>
                    <xsl:otherwise>Learn More</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="buttonurl">
            	<xsl:choose>
                	<xsl:when test="URL[not(.='')]"><xsl:value-of select="URL"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$ROOTDIR"/><xsl:value-of select="ID"/></xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="imgurl">
            	<xsl:choose>
                	<xsl:when test="THUMBNAILURL[not(.='')]"><xsl:value-of select="THUMBNAILURL" disable-output-escaping="yes"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$ROOTDIR" disable-output-escaping="yes"/>/getimage.asp?id=<xsl:value-of select="ID" disable-output-escaping="yes"/>&amp;filename=<xsl:value-of select="IMAGE/NAME" disable-output-escaping="yes"/>&amp;mode=6</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <div class="col-sm-4">
                    <div class="thumbnail">
                    	<a href="{URL}"><div class="image-grid"><div class="image-carousel-4" style="background:url('{$imgurl}') no-repeat center center; background-size:cover; -moz-background-size:cover; -webkit-background-size:cover; -o-background-size:cover;"></div></div></a>
                        <div class="caption caption-sizes">
                            <h4 class="text-center"><xsl:value-of select="NAME"/></h4>
                            <a href="{$buttonurl}" class="btn btn-sm btn-primary btn-block"><strong><xsl:value-of select="$buttontexts"/></strong></a>
                        </div>
                    </div>
               </div>
        </xsl:if>
        </xsl:for-each>
        </div>
         <div class="row">
        
        <xsl:for-each select="/ROOT/CHILDREN/OBJECT">
            <xsl:sort select="SORTKEY" data-type="number"/>
            <xsl:if test="(position() &gt; 3) and (position() &lt; 7)">
            <xsl:variable name="buttontexts">
            	<xsl:choose>
                	<xsl:when test="BUTTON[not(.='')]"><xsl:value-of select="BUTTON"/></xsl:when>
                    <xsl:otherwise>Learn More</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="buttonurl">
            	<xsl:choose>
                	<xsl:when test="URL[not(.='')]"><xsl:value-of select="URL"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$ROOTDIR"/><xsl:value-of select="ID"/></xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="imgurl">
            	<xsl:choose>
                	<xsl:when test="THUMBNAILURL[not(.='')]"><xsl:value-of select="THUMBNAILURL" disable-output-escaping="yes"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$ROOTDIR" disable-output-escaping="yes"/>/getimage.asp?id=<xsl:value-of select="ID" disable-output-escaping="yes"/>&amp;filename=<xsl:value-of select="IMAGE/NAME" disable-output-escaping="yes"/>&amp;mode=6</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <div class="col-sm-4">
                    <div class="thumbnail">
                    	<a href="{URL}"><div class="image-grid"><div class="image-carousel-4" style="background:url('{$imgurl}') no-repeat center center; background-size:cover; -moz-background-size:cover; -webkit-background-size:cover; -o-background-size:cover;"></div></div></a>
                        <div class="caption caption-sizes">
                            <h4 class="text-center"><xsl:value-of select="NAME"/></h4>
                            <a href="{$buttonurl}" class="btn btn-sm btn-primary btn-block"><strong><xsl:value-of select="$buttontexts"/></strong></a>
                        </div>
                    </div>
               </div>
        </xsl:if>
        </xsl:for-each>
        </div>
         <div class="row">
        
        <xsl:for-each select="/ROOT/CHILDREN/OBJECT">
            <xsl:sort select="SORTKEY" data-type="number"/>
            <xsl:if test="(position() &gt; 6) and (position() &lt; 10)">
            <xsl:variable name="buttontexts">
            	<xsl:choose>
                	<xsl:when test="BUTTON[not(.='')]"><xsl:value-of select="BUTTON"/></xsl:when>
                    <xsl:otherwise>Learn More</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="buttonurl">
            	<xsl:choose>
                	<xsl:when test="URL[not(.='')]"><xsl:value-of select="URL"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$ROOTDIR"/><xsl:value-of select="ID"/></xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="imgurl">
            	<xsl:choose>
                	<xsl:when test="THUMBNAILURL[not(.='')]"><xsl:value-of select="THUMBNAILURL" disable-output-escaping="yes"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$ROOTDIR" disable-output-escaping="yes"/>/getimage.asp?id=<xsl:value-of select="ID" disable-output-escaping="yes"/>&amp;filename=<xsl:value-of select="IMAGE/NAME" disable-output-escaping="yes"/>&amp;mode=6</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <div class="col-sm-4">
                    <div class="thumbnail">
                    	<a href="{URL}"><div class="image-grid"><div class="image-carousel-4" style="background:url('{$imgurl}') no-repeat center center; background-size:cover; -moz-background-size:cover; -webkit-background-size:cover; -o-background-size:cover;"></div></div></a>
                        <div class="caption caption-sizes">
                            <h4 class="text-center"><xsl:value-of select="NAME"/></h4>
                            <a href="{$buttonurl}" class="btn btn-sm btn-primary btn-block"><strong><xsl:value-of select="$buttontexts"/></strong></a>
                        </div>
                    </div>
               </div>
        </xsl:if>
        </xsl:for-each>
        </div>
         <div class="row">
        <xsl:for-each select="/ROOT/CHILDREN/OBJECT">
            <xsl:sort select="SORTKEY" data-type="number"/>
            <xsl:if test="(position() &gt; 9) and (position() &lt; 13)">
            <xsl:variable name="buttontexts">
            	<xsl:choose>
                	<xsl:when test="BUTTON[not(.='')]"><xsl:value-of select="BUTTON"/></xsl:when>
                    <xsl:otherwise>Learn More</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="buttonurl">
            	<xsl:choose>
                	<xsl:when test="URL[not(.='')]"><xsl:value-of select="URL"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$ROOTDIR"/><xsl:value-of select="ID"/></xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
             <xsl:variable name="imgurl">
            	<xsl:choose>
                	<xsl:when test="THUMBNAILURL[not(.='')]"><xsl:value-of select="THUMBNAILURL" disable-output-escaping="yes"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$ROOTDIR" disable-output-escaping="yes"/>/getimage.asp?id=<xsl:value-of select="ID" disable-output-escaping="yes"/>&amp;filename=<xsl:value-of select="IMAGE/NAME" disable-output-escaping="yes"/>&amp;mode=6</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <div class="col-sm-4">
                    <div class="thumbnail">
                    	<a href="{URL}"><div class="image-grid"><div class="image-carousel-4" style="background:url('{$imgurl}') no-repeat center center; background-size:cover; -moz-background-size:cover; -webkit-background-size:cover; -o-background-size:cover;"></div></div></a>
                        <div class="caption caption-sizes">
                            <h4 class="text-center"><xsl:value-of select="NAME"/></h4>
                            <a href="{$buttonurl}" class="btn btn-sm btn-primary btn-block"><strong><xsl:value-of select="$buttontexts"/></strong></a>
                        </div>
                    </div>
               </div>
        </xsl:if>
        </xsl:for-each>
         </div>
         <div class="row">
         <xsl:for-each select="/ROOT/CHILDREN/OBJECT">
            <xsl:sort select="SORTKEY" data-type="number"/>
            <xsl:if test="(position() &gt; 12) and (position() &lt; 16)">
            <xsl:variable name="buttontexts">
            	<xsl:choose>
                	<xsl:when test="BUTTON[not(.='')]"><xsl:value-of select="BUTTON"/></xsl:when>
                    <xsl:otherwise>Learn More</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="buttonurl">
            	<xsl:choose>
                	<xsl:when test="URL[not(.='')]"><xsl:value-of select="URL"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$ROOTDIR"/><xsl:value-of select="ID"/></xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="imgurl">
            	<xsl:choose>
                	<xsl:when test="THUMBNAILURL[not(.='')]"><xsl:value-of select="THUMBNAILURL" disable-output-escaping="yes"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$ROOTDIR" disable-output-escaping="yes"/>/getimage.asp?id=<xsl:value-of select="ID" disable-output-escaping="yes"/>&amp;filename=<xsl:value-of select="IMAGE/NAME" disable-output-escaping="yes"/>&amp;mode=6</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <div class="col-sm-4">
                    <div class="thumbnail">
                    	<a href="{URL}"><div class="image-grid"><div class="image-carousel-4" style="background:url('{$imgurl}') no-repeat center center; background-size:cover; -moz-background-size:cover; -webkit-background-size:cover; -o-background-size:cover;"></div></div></a>
                        <div class="caption caption-sizes">
                            <h4 class="text-center"><xsl:value-of select="NAME"/></h4>
                            <a href="{$buttonurl}" class="btn btn-sm btn-primary btn-block"><strong><xsl:value-of select="$buttontexts"/></strong></a>
                        </div>
                    </div>
               </div>
       
        </xsl:if>
        </xsl:for-each>
         </div>
        
        
     
    </div>
	
</xsl:template>

<xsl:template name="ShowPage" ></xsl:template>


</xsl:stylesheet>

	
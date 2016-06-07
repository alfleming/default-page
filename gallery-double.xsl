<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt">

<xsl:import href="../system.xsl"/>

<xsl:template match="/">

	<xsl:variable name="items">
		<ROOT><xsl:copy-of select="/ROOT/SETTINGS"/><xsl:copy-of select="/ROOT/ACCESSRIGHTS"/><xsl:copy-of select="/ROOT/OBJECT"/></ROOT>
		<xsl:for-each select="/ROOT/OBJECT/IMAGE">
			<xsl:sort select="SORTKEY" data-type="number"/>
			<xsl:copy-of select="."/>
		</xsl:for-each>
	</xsl:variable>
    
    <xsl:if test="count(msxsl:node-set($items)/IMAGE) &gt; 16">
    
    <div id="paginatorlinks" class="container-fluid">
    	<div class="row">
        	<div class="col-sm-3 col-sm-offset-9">
                <ul class="pagination pull-right">
                  <li><a href="#gallery-paginater-carousel" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                  <li><a href="#gallery-paginater-carousel" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
                </ul>
            </div>
        </div>
    </div>
    
    </xsl:if>
    
    <div id="gallery-paginater-carousel" class="carousel carousel-fade slide" data-ride="carousel" style="overflow:hidden;">

          <div class="carousel-inner">
              <xsl:for-each select="msxsl:node-set($items)/IMAGE">
              	<xsl:variable name="numbered" select="position()"/>
                    <div class="col-sm-3 thumb-collector">
                        <div class="thumbnail thumbnail-gallery">
                            <a href="{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=6" title="{CAPTION}" class="magnific-img-link">
                                <div class="gallery-thumbnails" style="background:url({$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=6) no-repeat center center; background-size:cover; margin-bottom:0; height:200px;"></div>
                            </a>
                        </div>
                    </div>
                </xsl:for-each>
          </div>
        </div>

</xsl:template>

<xsl:template name="ShowPage" ></xsl:template>

</xsl:stylesheet>

	
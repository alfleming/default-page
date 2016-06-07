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
        
    <div id="photos-masonry">

              <xsl:for-each select="msxsl:node-set($items)/IMAGE">
              	<xsl:variable name="numbered" select="position()"/>
					
                    <div class="item-masonry">
                    <a href="{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=0" title="{CAPTION}" class="gallery-popup-link triggerhover">
						<div class="hidden-texts"><xsl:value-of select="CAPTION" disable-output-escaping="yes" /></div>
							<img src="{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=9" class="img-responsive img-scale gridimg" style="z-index:0 !important;" />
                    </a>
					</div>
					
                </xsl:for-each>
        </div>

</xsl:template>

<xsl:template name="ShowPage" ></xsl:template>

</xsl:stylesheet>

	
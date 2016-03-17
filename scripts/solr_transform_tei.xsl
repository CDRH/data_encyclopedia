<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xpath-default-namespace="http://www.tei-c.org/ns/1.0">
	<xsl:output indent="yes"/>
	<xsl:template match="/">
		<add>
			<doc>

				<field name="id">
					<xsl:value-of select="/TEI/@xml:id"/>
				</field>

				<field name="titleMain">
					<xsl:value-of
						select="TEI/teiHeader[1]/fileDesc[1]/titleStmt[1]/title[@type='main']"/>
				</field>

				<field name="author">
					<xsl:value-of
						select="/TEI/teiHeader[1]/fileDesc[1]/sourceDesc[1]/bibl[1]/author/@n"/>
				</field>


				<!--xsl:apply-templates/-->
				<field name="text">

					<xsl:for-each select="descendant::note[@type='project']">
						<xsl:value-of select="."/>
						<xsl:text> </xsl:text>
					</xsl:for-each>

					<xsl:for-each select="descendant::text">
						<xsl:value-of select="."/>
						<xsl:text> </xsl:text>
					</xsl:for-each>
				</field>
			</doc>
		</add>


	</xsl:template>

	<!-- ignore tags -->
	<!--<xsl:template match="revisionDesc"/> 
	<xsl:template match="availability"/>
	<xsl:template match="principal"/>
	<xsl:template match="date"/>
	<xsl:template match="publicationStmt"/>
	<xsl:template match="keywords"/>-->

	<!--xsl:template match="text()">
		<xsl:if test="normalize-space(.) != ''">
			<field name="text">
				<xsl:value-of select="normalize-space(.)"/>
			</field>
		</xsl:if>
	</xsl:template-->
</xsl:stylesheet>

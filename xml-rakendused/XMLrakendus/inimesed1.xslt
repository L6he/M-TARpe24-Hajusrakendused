<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output encoding="UTF-8" method="html" />
<xsl:template match="/">
	Esimene:<br/><xsl:value-of select="/inimesed/inimene[1]/eesnimi" />;<br/><br/>
	Viimane:<br/><xsl:value-of select="/inimesed/inimene[last()]/eesnimi" />;<br/><br/>
	Esimesed kolm perekonnanime:<br/>
	<xsl:value-of select="/inimesed/inimene[1]/perenimi" />;<br/>
	<xsl:value-of select="/inimesed/inimene[2]/perenimi" />;<br/>
	<xsl:value-of select="/inimesed/inimene[3]/perenimi" />;<br/><br/>

	Sood:<br/>
	<xsl:for-each select="inimesed/inimene">
		<xsl:value-of select="sugu" />;
		<br/>
	</xsl:for-each><br/>

	Eelviimase inimese perekonnanimi:<br/><xsl:value-of select="/inimesed/inimene[last() - 1]/perenimi" />.<br/><br/>
	
	<table>
		<tr>
			<th>Inimeste vanuste vahe</th>
			<xsl:for-each select="/inimesed/inimene">
				<th>
					<xsl:value-of select="concat(eesnimi, ', ', synd)"></xsl:value-of>
				</th>
			</xsl:for-each>
		</tr>
		<xsl:for-each select="/inimesed/inimene">
			<tr>
				<xsl:variable name="v2limine" select="." />
				<td>
					<xsl:value-of select="eesnimi" />
				</td>
				<xsl:for-each select="/inimesed/inimene">
					<td>
						<xsl:variable name="sum41" select="number(synd)-number($v2limine/synd)" />
						<xsl:if test="$sum41 &gt; -6 and $sum41 &lt; 6">
							<xsl:attribute name="style">
								background-color:yellow
							</xsl:attribute>
						</xsl:if>
						
						<xsl:value-of select="$sum41" />
					</td>
				</xsl:for-each>
			</tr>
		</xsl:for-each>
	</table>
	<br/>
	<br/>

	<table>
		<tr>
			<th>Inimeste vanuste vahe</th>
			<xsl:for-each select="/inimesed/inimene">
				<th>
					<xsl:value-of select="concat(eesnimi, ', ', synd)"></xsl:value-of>
				</th>
			</xsl:for-each>
		</tr>
		<xsl:for-each select="/inimesed/inimene">
			<tr>
				<xsl:variable name="v2limine" select="." />
				<td>
					<xsl:value-of select="eesnimi" />
				</td>
				<xsl:for-each select="/inimesed/inimene">
					<td>
						<xsl:if test="position() != $v2limine">
							<xsl:if test="not($v2limine/perenimi = perenimi)">
								<xsl:value-of select="$v2limine/perenimi"/> ja
								<xsl:value-of select="perenimi"/>
							</xsl:if>
							<xsl:if test="$v2limine/perenimi = perenimi">
								-
							</xsl:if>
						</xsl:if>
					</td>
				</xsl:for-each>
			</tr>
		</xsl:for-each>
	</table>
</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>Rapport des mandats</title>
                <style>
                    body {
                        font-family: "Segoe UI", Arial, sans-serif;
                        background: #f4f6f9;
                        margin: 0;
                        padding: 30px;
                        color: #2c3e50;
                    }
                    h1 {
                        text-align: center;
                        color: #1f4e79;
                        margin-bottom: 24px;
                    }
                    table {
                        border-collapse: collapse;
                        margin: 0 auto;
                        background: #fff;
                        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
                    }
                    th {
                        background: #1f4e79;
                        color: #fff;
                        padding: 12px 18px;
                        text-align: left;
                    }
                    td {
                        padding: 10px 18px;
                        border-bottom: 1px solid #dde3ea;
                        vertical-align: top;
                    }
                    tr:nth-child(even) td { background: #f0f4f9; }
                    tr:hover td { background: #e2ecf7; }
                    .montant { text-align: right; font-weight: bold; }
                    .detail { color: #7f8c8d; font-size: 0.85em; }
                    .etat {
                        display: inline-block;
                        padding: 3px 10px;
                        border-radius: 12px;
                        font-weight: bold;
                        font-size: 0.9em;
                    }
                    .recu { background: #d4efdf; color: #1e8449; }
                    .nonrecu { background: #fadbd8; color: #c0392b; }
                </style>
            </head>
            <body>
                <h1>Rapport des mandats</h1>
                <table>
                    <tr>
                        <th>N° mandat</th>
                        <th>Date</th>
                        <th>Montant</th>
                        <th>Etat</th>
                        <th>Expéditeur</th>
                        <th>Destinataire</th>
                    </tr>
                    <xsl:for-each select="rapport/mandat">
                        <tr>
                            <td><xsl:value-of select="@num"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td class="montant"><xsl:value-of select="@montant"/></td>
                            <td>
                                <span>
                                    <xsl:attribute name="class">
                                        <xsl:choose>
                                            <xsl:when test="@etat = 'reçu'">etat recu</xsl:when>
                                            <xsl:otherwise>etat nonrecu</xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:value-of select="@etat"/>
                                </span>
                            </td>
                            <td>
                                <xsl:value-of select="expediteur/@prenom"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="expediteur/@nom"/>
                                <br/>
                                <span class="detail">
                                    CIN : <xsl:value-of select="expediteur/@cin"/>
                                    <br/>
                                    Ville : <xsl:value-of select="expediteur/@ville"/>
                                </span>
                            </td>
                            <td>
                                <xsl:value-of select="destinataire/@prenom"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="destinataire/@nom"/>
                                <br/>
                                <span class="detail">
                                    CIN : <xsl:value-of select="destinataire/@cin"/>
                                    <br/>
                                    Ville : <xsl:value-of select="destinataire/@ville"/>
                                </span>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

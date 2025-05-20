<%@ page import="com.gestionstock.entities.Produit, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste des Produits</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        tr:nth-child(even) { background-color: #f9f9f9; }
    </style>
</head>
<body>
<h1 style="text-align: center;">Liste des Produits</h1>

<div style="text-align: center; margin: 20px;">
    <a href="produits?action=new" style="padding: 8px 16px; background: #4CAF50; color: white; text-decoration: none;">Ajouter un produit</a>
</div>

<table>
    <tr>
        <th>Référence</th>
        <th>Désignation</th>
        <th>Prix Achat</th>
        <th>Prix Vente</th>
        <th>Quantité</th>
        <th>Actions</th>
    </tr>

    <%
        List<Produit> produits = (List<Produit>) request.getAttribute("produits");
        if (produits != null) {
            for (Produit p : produits) {
    %>
    <tr>
        <td><%= p.getReference() %></td>
        <td><%= p.getDesignation() %></td>
        <td><%= String.format("%.2f", p.getPrixAchat()) %></td>
        <td><%= String.format("%.2f", p.getPrixVente()) %></td>
        <td><%= p.getQuantite() %></td>
        <td>
            <a href="produits?action=edit&id=<%= p.getId() %>">Modifier</a> |
            <a href="produits?action=delete&id=<%= p.getId() %>"
               onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce produit ?')">Supprimer</a>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>
</body>
</html>

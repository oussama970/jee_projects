<%@ page import="com.example.stock.Produit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Produit produit = (Produit) request.getAttribute("produit");
    boolean isNew = produit == null || produit.getId() == null;
%>
<html>
<head>
    <title><%= isNew ? "Ajouter" : "Modifier" %> un Produit</title>
    <style>
        .form-container { width: 50%; margin: 20px auto; }
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 150px; }
        input[type="text"], input[type="number"] { padding: 6px; width: 200px; }
        .btn-submit { padding: 8px 16px; background: #4CAF50; color: white; border: none; }
    </style>
</head>
<body>
<h1 style="text-align: center;"><%= isNew ? "Ajouter" : "Modifier" %> un Produit</h1>

<div class="form-container">
    <form action="produits" method="post">
        <input type="hidden" name="action" value="<%= isNew ? "save" : "update" %>">
        <% if (!isNew) { %>
        <input type="hidden" name="id" value="<%= produit.getId() %>">
        <% } %>

        <div class="form-group">
            <label for="reference">Référence:</label>
            <input type="text" id="reference" name="reference"
                   value="<%= !isNew ? produit.getReference() : "" %>" required>
        </div>

        <div class="form-group">
            <label for="designation">Désignation:</label>
            <input type="text" id="designation" name="designation"
                   value="<%= !isNew ? produit.getDesignation() : "" %>" required>
        </div>

        <div class="form-group">
            <label for="prixAchat">Prix Achat:</label>
            <input type="number" step="0.01" id="prixAchat" name="prixAchat"
                   value="<%= !isNew ? produit.getPrixAchat() : "" %>" required>
        </div>

        <div class="form-group">
            <label for="prixVente">Prix Vente:</label>
            <input type="number" step="0.01" id="prixVente" name="prixVente"
                   value="<%= !isNew ? produit.getPrixVente() : "" %>" required>
        </div>

        <div class="form-group">
            <label for="quantite">Quantité:</label>
            <input type="number" id="quantite" name="quantite"
                   value="<%= !isNew ? produit.getQuantite() : "0" %>" required>
        </div>

        <div style="text-align: center; margin-top: 20px;">
            <button type="submit" class="btn-submit">Enregistrer</button>
            <a href="produits" style="margin-left: 10px;">Annuler</a>
        </div>
    </form>
</div>
</body>
</html>
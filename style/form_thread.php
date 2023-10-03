<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<div class="container mt-5">
        <h1>Cadastro de Thread</h1>
        <form action="includes/thread.php" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="context" class="form-label">Context</label>
                <input type="text" class="form-control" id="context" name="context">
            </div>
            
            <div class="mb-3">
                <label for="pet-select" class="form-label">Theme</label>
                <select class="form-select" id="pet-select" name="pets">
                    <option value=""></option>
                    <option value="dog">Dog</option>
                </select>
            </div>
            
            <div class="mb-3">
                <label for="media" class="form-label">Upload Media</label>
                <input type="file" class="form-control" id="media" name="media">
            </div>
            
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
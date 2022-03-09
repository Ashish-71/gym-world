<?php
        // active deactive and edit catagories from daatabse and validations.

require('top.inc.php');
$categories_id='';
$name='';
$mrp='';
$price='';
$qty='';
$image='';
$short_desc='';
$description='';
$meta_title='';
$meta_keyword='';
$meta_desc=''; 


$msg='';
$image_required='required';
if (isset($_GET['id']) && $_GET['id']!=''){
   $image_required='';
   $id=get_safe_value($con,$_GET['id']);
   $res=mysqli_query($con,"select * from product where id='$id'");
   $check=mysqli_num_rows($res);
   if($check>0){
      $row=mysqli_fetch_assoc($res);
      $categories_id=$row['categories_id'];
      $name=$row['name'];
      $mrp=$row['mrp'];
      $price=$row['price'];
      $qty=$row['qty'];
      $short_desc=$row['short_desc'];
      $description=$row['description'];
      $meta_title=$row['meta_title'];
      $meta_keyword=$row['meta_keyword'];
      $meta_desc=$row['meta_desc'];
   }else{
      header('location:product.php');
      die();
   }
  
}

if(isset($_POST['submit'])){
   $categories_id=get_safe_value($con,$_POST['categories_id']);
   $name=get_safe_value($con,$_POST['name']);
   $mrp=get_safe_value($con,$_POST['mrp']);
   $price=get_safe_value($con,$_POST['price']);
   $qty=get_safe_value($con,$_POST['qty']);
   $short_desc=get_safe_value($con,$_POST['short_desc']);
   $description=get_safe_value($con,$_POST['description']);
   $meta_title=get_safe_value($con,$_POST['meta_title']);
   $meta_keyword=get_safe_value($con,$_POST['meta_keyword']);
   $meta_desc=get_safe_value($con,$_POST['meta_desc']);

   $res=mysqli_query($con,"select * from product where name='$name'");
   $check=mysqli_num_rows($res);
   if($check>0){
      if (isset($_GET['id']) && $_GET['id']!=''){
         $getData=mysqli_fetch_assoc($res);
            if($id==$getData['id']){

            }else{
               $msg="Product is already exist";
            }

      }else{ 

         $msg="Product is already exist";
   }
   }
   if($msg==''){
      if (isset($_GET['id']) && $_GET['id']!=''){
         if($_FILES['image']['name']!=''){
            $image=rand(111111111,999999999).'_'.$_FILES['image']['name'];
            move_uploaded_file($_FILES['image']['tmp_name'],'../media/product/'.$image);
            $update_sql="update product set categories_id='$categories_id',name='$name',mrp='$mrp',price='$price',qty='$qty',short_desc='$short_desc',description='$description',meta_title='$meta_title',meta_keyword='$meta_keyword',meta_desc='$meta_desc',image='$image' where id='$id'";
         }else{
            $update_sql="update product set categories_id='$categories_id',name='$name',mrp='$mrp',price='$price',qty='$qty',short_desc='$short_desc',description='$description',meta_title='$meta_title',meta_keyword='$meta_keyword',meta_desc='$meta_desc'where id='$id'";

         }
         mysqli_query($con,$update_sql);
   }else{
         $image=rand(111111111,999999999).'_'.$_FILES['image']['name'];
         move_uploaded_file($_FILES['image']['tmp_name'],'../media/product/'.$image);
          mysqli_query($con,"insert into product(categories_id,name,mrp,price, qty,short_desc,description,meta_title,meta_keyword,meta_desc,status,image) values('$categories_id','$name','$mrp','$price','$qty','$short_desc','$description','$meta_title','$meta_keyword','$meta_desc',1,'$image')");
}

      header('location:product.php');
       die();
   }
}

?>
 <div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Product</strong><small> Form</small></div>
                        <form method="post" enctype="multipart/form-data">
                        <div class="card-body card-block">
                           <div class="form-group"><label for="categories" class=" form-control-label">Product</label>
                           <select class="form-control" name="categories_id">
                              <option>Select categories</option>
                              <?php
                                 $res=mysqli_query($con,"select id,categories from categories order by categories asc");
                                 while($row=mysqli_fetch_assoc($res)){
                                    if($row['id']==$categories_id){
                                       echo "<option selected value=".$row['id'].">".$row['categories']."</option>";
                                    }else{
                                       echo "<option value=".$row['id'].">".$row['categories']."</option>";
                                    }
                                   
                                 }
                                 
                              ?>
                           </select>
                           <div class="card-body card-block">
                           <div class="form-group"><label for="categories" class=" form-control-label">Product name</label><input type="text" name="name" id="company" placeholder="Enter your Product name" class="form-control"  required value="<?php echo $name?>"></div>
                           <div class="form-group"><label for="categories" class=" form-control-label">Mrp</label><input type="text" name="mrp" id="company" placeholder="Enter your Product mrp" class="form-control"  required value="<?php echo $mrp?>"></div>
                           <div class="form-group"><label for="categories" class=" form-control-label">Price</label><input type="text" name="price" id="company" placeholder="Enter your Product price" class="form-control"  required value="<?php echo $price?>"></div>
                           <div class="form-group"><label for="categories" class=" form-control-label">Qty</label><input type="text" name="qty" id="company" placeholder="Enter your Product qty" class="form-control"  required value="<?php echo $qty?>"></div>
                           <div class="form-group"><label for="categories" class=" form-control-label">Image</label><input type="file" name="image"  class="form-control"<?php  echo $image_required   ?>></div>
                           <div class="form-group"><label for="categories" class=" form-control-label">Short Description</label><textarea type="text" name="short_desc" id="company" placeholder="Enter your Product short description" class="form-control"  required><?php echo $short_desc?></textarea>
                           <div class="form-group"><label for="categories" class=" form-control-label">Description</label><textarea type="text" name="description" id="company" placeholder="Enter your Product description" class="form-control"  required><?php echo $description?></textarea>
                           <div class="form-group"><label for="categories" class=" form-control-label">Meta title</label><textarea type="text" name="meta_title" id="company" placeholder="Enter your Product meta title" class="form-control"><?php echo $meta_title?></textarea>
                           <div class="form-group"><label for="categories" class=" form-control-label">Meta description</label><textarea type="text" name="meta_desc" id="company" placeholder="Enter your Product meta description" class="form-control"><?php echo $meta_desc?></textarea>
                           <div class="form-group"><label for="categories" class=" form-control-label">Meta keyword</label><textarea type="text" name="meta_keyword" id="company" placeholder="Enter your Product meta keyword" class="form-control" ><?php echo $meta_keyword?></textarea>

                            <button id="payment-button" type="submit" name="submit" class="btn btn-lg btn-info btn-block">
                           <span id="payment-button-amount" name="submit">Submit</span>
                           </button>
                           <div class="field_error"><?php echo $msg?></div>
                        </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
<?php
require('footer.inc.php');
?>
        
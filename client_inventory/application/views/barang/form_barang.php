<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<h4>Isikan data dengan lengkap</h4>
				<form class="form-horizontal form-material" id="formBarang">
					<div class="form-group">
						<label class="col-md-12">Nama Barang</label>
						<div class="col-md-12">
							<input type="text" placeholder="Inputkan nama barang" class="form-control form-control-line form-user-input" name="nama_barang" id="nama_barang">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-12">Deskripsi</label>
						<div class="col-md-12">
							<textarea rows="5" class="form-control form-control-line form-user-input" name="deskripsi" id="deskripsi" placeholder="Ceritakan barang"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-12">Stok</label>
						<div class="col-md-12">
							<input type="number" rows="5" class="form-control form-control-line form-user-input" name="stok" id="stok" placeholder="Stok"></input>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input class="form-user-input" type="hidden" name="id_barang" id="id_barang" value="">
							<button class="btn btn-success" type="submit">Simpan Data Barang</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$('#formBarang').on('submit', function(e) {
		e.preventDefault();
		sendDataPost();
	});

	function sendDataPost() {
		<?php
		if ($titel == 'Form Edit Data Barang') {
			echo "var link = 'http://localhost/PraktikAjax/backend_inventory/barang/update_action';";
		} else {
			echo "var link = 'http://localhost/PraktikAjax/backend_inventory/barang/create_action';";
		}
		?>
		var dataForm = {};
		var allInput = $('.form-user-input');

		$.each(allInput, function(i, val) {
			dataForm[val['name']] = val['value'];
		});

		$.ajax(link, {
			type: 'POST',
			data: dataForm,
			success: function(data, status, xhr) {
				var data_str = JSON.parse(data);
				alert(data_str['pesan']);
				loadMenu('<?= base_url('barang') ?>');
			},
			error: function(jqXHR, textStatus, errorMsg) {
				alert('Error : ' + errorMsg);
			}
		});
	}

	function getDetail(id_barang) {
		var link = 'http://localhost/PraktikAjax/backend_inventory/barang/detail?id_barang=' + id_barang;

		$.ajax(link, {
			type: 'GET',
			success: function(data, status, xhr) {
				var data_obj = JSON.parse(data);
				$('#nama_barang').val(data_obj['detail']['nama_barang']);
				$('#deskripsi').val(data_obj['detail']['deskripsi']);
				$('#id_barang').val(data_obj['detail']['id_barang']);
				$('#stok').val(data_obj['detail']['stok']);
			},
			error: function(jqXHR, textStatus, errorMsg) {
				alert('Error : ' + errorMsg);
			}
		});

		// $.ajax(link, {
		// 	type: 'GET',
		// 	success: function(data, status, xhr) {
		// 		var data_obj = JSON.parse(data);
		// 		if (data_obj['sukses'] == 'ya') {
		// 			var detail = data_obj['detail'];
		// 			$('#nama_barang').val(detail['nama_barang']);
		// 			$('#id_barang').val(detail['id_barang']);
		// 			$('#deskripsi').val(detail['deskripsi']);
		// 			$('#stok').val(detail['stok']);
		// 		} else {
		// 			alert('Data Tidak Ditemukan');
		// 		}
		// 	}
		// });
	}

	<?php
	if ($titel == 'Form Edit Data Barang') {
		echo 'getDetail(' . $id_barang . ');';
	}
	?>

	loadKonten('http://localhost/PraktikAjax/backend_inventory/barang/list_barang');
</script>

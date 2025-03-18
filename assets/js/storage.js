function saveRoomDesign() {
    let data = JSON.stringify(scene.children.map(obj => ({
        position: obj.position,
        type: obj.type
    })));

    localStorage.setItem('roomDesign', data);
}

function loadRoomDesign() {
    let data = localStorage.getItem('roomDesign');
    if (data) {
        let objects = JSON.parse(data);
        objects.forEach(obj => {
            let geometry = new THREE.BoxGeometry(1, 1, 1);
            let material = new THREE.MeshStandardMaterial({ color: 0xff0000 });
            let mesh = new THREE.Mesh(geometry, material);
            mesh.position.copy(obj.position);
            scene.add(mesh);
        });
    }
}

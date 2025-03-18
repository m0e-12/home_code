function addFurniture(type) {
    let geometry, material;

    switch (type) {
        case 'chair':
            geometry = new THREE.BoxGeometry(0.5, 1, 0.5);
            material = new THREE.MeshStandardMaterial({ color: 0xff0000 });
            break;
        case 'table':
            geometry = new THREE.BoxGeometry(1, 0.75, 1);
            material = new THREE.MeshStandardMaterial({ color: 0x00ff00 });
            break;
        default:
            return;
    }

    let furniture = new THREE.Mesh(geometry, material);
    furniture.position.set(Math.random() * 4 - 2, 0.5, Math.random() * 4 - 2);
    scene.add(furniture);
}

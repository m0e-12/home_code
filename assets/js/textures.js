function changeFloorTexture(textureURL) {
    let loader = new THREE.TextureLoader();
    loader.load(textureURL, function (texture) {
        let floor = scene.children.find(obj => obj.geometry instanceof THREE.PlaneGeometry);
        floor.material.map = texture;
        floor.material.needsUpdate = true;
    });
}
